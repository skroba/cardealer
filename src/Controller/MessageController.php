<?php

namespace App\Controller;
use App\Entity\Messages;
use App\Repository\AdsRepository;
use App\Repository\BikesRepository;
use App\Repository\MessagesRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MessageController extends AbstractController {
	/**
	 * @Route("/message", name="message")
	 */
	public function index(MessagesRepository $messagesRepository, UserRepository $userRepository, AdsRepository $adsRepository) {
		$messages = $messagesRepository->findBy(['receiver' => $this->getUser()->getId()],
			['id' => 'DESC']);
		$seen = '';
		foreach ($messages as $message) {
			$sender = $userRepository->findOneBy(['id' => $message->getSender()]);
			$car = $adsRepository->findOneBy(['id' => $message->getAd()]);
			if (!empty($car)) {
				$message->setSender($sender->getUsername());
				$message->setAd($car->getMaker() . ' ' . $car->getModel());
			}

			// dump($car);die;
			if ($message->getSeen() == 0) {
				$seen++;

			}

		}

		return $this->render('message/index.html.twig', ['messages' => $messages, 'seen' => $seen]);
	}

	/**
	 * @Route("/message/{id?}/new", name="message.create")
	 */
	public function create(Request $request, $id, AdsRepository $adsRepository, BikesRepository $bikesRepository) {
		$receiver = $adsRepository->findOneBy(['id' => $id]);
		if (empty($receiver)) {
			$receiver = $bikesRepository->findOneBy(['id' => $id]);
		}

		$message = new Messages;
		$message->setReceiver($receiver->getContact());
		$message->setSender($this->getUser()->getId());
		$message->setAd($id);
		$message->setTimestamp(new \DateTime());
		$message->setSeen(false);
		$form = $this->createFormBuilder($message)
			->add('text', TextType::class)
			->add('save', SubmitType::class, ['label' => 'Send Message'])
			->getForm();

		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {
			$entityManager = $this->getDoctrine()->getManager();

			$entityManager->persist($message);
			$entityManager->flush();

			return $this->render('message/create.html.twig', [
				'form' => $form->createView(),
				'message' => 'Message sent successfully',
			]);
		}

		return $this->render('message/create.html.twig', [
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/message/{messages}", name="message.show", methods={"GET"})
	 */
	public function show(Messages $messages, UserRepository $userRepository, AdsRepository $adsRepository, BikesRepository $bikesRepository): Response {

		if ($messages->getSender() == $this->getUser()->getId() || $messages->getReceiver() == $this->getUser()->getId()) {

			//stavi seen na true(poruka je vidjena)
			$entityManager = $this->getDoctrine()->getManager();
			$messages->setSeen(true);
			$entityManager->persist($messages);
			$entityManager->flush();

			$car = $adsRepository->findOneBy(['id' => $messages->getAd()]);
			if (empty($car)) {
				$car = $bikesRepository->findOneBy(['id' => $messages->getAd()]);
			}
			if (!empty($car)) {
				$car = $car->getMaker() . ' ' . $car->getModel();
				$sender = $userRepository->findOneBy(['id' => $messages->getSender()]);
				$messages->setSender($sender->getUsername());

				return $this->render('message/show.html.twig', [
					'message' => $messages,
					'car' => $car,
					'sender' => $sender,
				]);
			} else {

				$sender = $userRepository->findOneBy(['id' => $messages->getSender()]);
				$messages->setSender($sender->getUsername());
				return $this->render('message/show.html.twig', [
					'message' => $messages,
					'sender' => $sender,
				]);

			}

		} else {
			return $this->redirectToRoute('app_login');
		}

	}

	/**
	 * @Route("/message/{id}/{sender?}", name="message.reply")
	 */
	public function reply(Request $request, $id, AdsRepository $adsRepository, $sender) {
		$receiver = $adsRepository->findOneBy(['id' => $id]);

		$message = new Messages;
		$message->setReceiver($sender);
		$message->setSender($this->getUser()->getId());
		$message->setAd($id);
		$message->setTimestamp(new \DateTime());
		$message->setSeen(false);
		$form = $this->createFormBuilder($message)
			->add('text', TextType::class)
			->add('save', SubmitType::class, ['label' => 'Send Message'])
			->getForm();

		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {
			$entityManager = $this->getDoctrine()->getManager();

			$entityManager->persist($message);
			$entityManager->flush();

			return $this->render('message/create.html.twig', [
				'form' => $form->createView(),
				'message' => 'Message sent successfully',
			]);
		}

		return $this->render('message/create.html.twig', [
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="message_delete", methods={"DELETE"})
	 */
	public function delete(Request $request, Messages $messages): Response {
		if ($this->isCsrfTokenValid('delete' . $messages->getId(), $request->request->get('_token'))) {
			$entityManager = $this->getDoctrine()->getManager();
			$entityManager->remove($messages);
			$entityManager->flush();
		}

		return $this->redirectToRoute('message');
	}

	/**
	 * @Route("/api/messages", name="apimessage")
	 */
	public function api(MessagesRepository $messagesRepository, UserRepository $userRepository, AdsRepository $adsRepository) {
		$messages = $messagesRepository->findBy(['receiver' => $this->getUser()->getId()],
			['id' => 'DESC']);
		$seen = '';
		foreach ($messages as $message) {
			$sender = $userRepository->findOneBy(['id' => $message->getSender()]);
			$car = $adsRepository->findOneBy(['id' => $message->getAd()]);
			// dump($car);die;
			if ($message->getSeen() == 0) {
				$seen++;

			}
		}
		if ($seen > 0) {
			$data = $seen . ' new messages';
		} else {
			$data = '';
		}

		$response = new Response();
		return $response->setContent($data);
	}

}
