<?php

namespace App\Controller;
use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

class RegisterController extends AbstractController {
	/**
	 * @Route("/register", name="register")
	 */
	public function register(Request $request, UserPasswordEncoderInterface $encoder, UserRepository $userRepository, \Swift_Mailer $mailer): Response{
		$form = $this->createFormBuilder()
			->add('username', TextType::class)
			->add('email', TextType::class)
			->add('telephone', TextType::class)
			->add('address', TextType::class)
			->add('password', RepeatedType::class, [
				'type' => PasswordType::class,
				'invalid_message' => 'The password fields must match.',
				'options' => ['attr' => ['class' => 'password-field']],
				'required' => true,
				'first_options' => ['label' => 'Password'],
				'second_options' => ['label' => 'Repeat Password'],
			])
			->add('register', SubmitType::class, ['label' => 'Register'])
			->getForm();
		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {

			if ($test = $userRepository->findOneBy(['username' => $form->getData()['username']])) {
				return $this->render('register/index.html.twig', [
					'form' => $form->createView(),
					'message' => 'Username already exist, choose another',
				]);
			} else {
				$hash = hash('sha256', $form->getData()['username']);
				$message = (new \Swift_Message('Wellcome to SymfBook'))
					->setFrom('aleksandarskrobic@gmail.com')
					->setTo($form->getData()['email'])
					->setBody(
						$this->renderView(
							// templates/emails/registration.html.twig
							'emails/registration.html.twig',
							['hash' => $hash,
								'name' => $form->getData()['username']]
						),
						'text/html'
					);

				$mailer->send($message);

				$user = new User;
				$user->setUsername($form->getData()['username']);
				$user->setTelephone($form->getData()['telephone']);
				$user->setAddress($form->getData()['address']);
				$user->setAuthenticated($hash);
				$user->setPassword($encoder->encodePassword($user, $form->getData()['password']));
				$user->setEmail($form->getData()['email']);
				$em = $this->getDoctrine()->getManager();

				$em->persist($user);
				$em->flush();
				return $this->redirectToRoute('app_login');
			}

		}

		return $this->render('register/index.html.twig', [
			'form' => $form->createView(),
			'message' => 'Register',
		]);
	}

	/**
	 * @Route("/register/{hash}", name="confirmation")
	 */
	public function confirmation($hash, UserRepository $userRepository) {
		// $user = new User;
		if ($user = $userRepository->findOneBy(['authenticated' => $hash])) {

			$em = $this->getDoctrine()->getManager();
			$user->setAuthenticated('ok');
			$em->persist($user);
			$em->flush();
			return $this->redirectToRoute('app_login');
		} else {
			return $this->redirectToRoute('app_login');
		}

	}
	/**
	 * @Route("/forgot", name="password_forgotten")
	 */
	public function forgot(Request $request, UserRepository $userRepository, \Swift_Mailer $mailer) {

		$form = $this->createFormBuilder()
			->add('reset', TextType::class)
			->add('button', SubmitType::class, ['label' => 'Reset'])
			->getForm();

		$form->handleRequest($request);

		if ($form->isSubmitted()) {
			$user = new User;
			$user = $userRepository->findOneBy(['username' => $form->getData()['reset']]);
			$hash = rand(100000000, 999999999);
			$user->setAuthenticated($hash);
			$em = $this->getDoctrine()->getManager();
			$em->persist($user);
			$em->flush();

			$message = (new \Swift_Message('Password restart'))
				->setFrom('aleksandarskrobic@gmail.com')
				->setTo($user->getEmail())
				->setBody(
					$this->renderView(
						'emails/reset.html.twig',
						['hash' => $hash,
							'name' => $user->getUsername()]
					),
					'text/html'
				);
			$mailer->send($message);
			return $this->redirectToRoute('app_login');
		}

		return $this->render('register/forgot.html.twig', [
			'form' => $form->createView(),
			'message' => 'Reset your password',
		]);
	}

	/**
	 * @Route("/reset/{hash?}", name="password_reset")
	 */
	public function reset($hash, UserRepository $userRepository, Request $request, UserPasswordEncoderInterface $encoder) {
		$user = new User;
		if ($hash) {
			$user = $userRepository->findOneBy(['authenticated' => $hash]);
		} else {
			$user = $this->getUser();
		}

		$form = $this->createFormBuilder()
			->add('password', RepeatedType::class, [
				'type' => PasswordType::class,
				'invalid_message' => 'The password fields must match.',
				'options' => ['attr' => ['class' => 'password-field']],
				'required' => true,
				'first_options' => ['label' => 'Password'],
				'second_options' => ['label' => 'Repeat Password'],
			])
			->add('change', SubmitType::class, ['label' => 'Change'])
			->getForm();

		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {
			$em = $this->getDoctrine()->getManager();
			$em->persist($user);
			$user->setPassword($encoder->encodePassword($user, $form->getData()['password']));
			$user->setAuthenticated('ok');
			$em->flush();
			return $this->redirectToRoute('home');
		}

		return $this->render('register/reset.html.twig', [
			'form' => $form->createView(),
			'message' => 'Reset your password',
		]);
	}
	/**
	 * @Route("/edit/", name="edituser")
	 */
	public function edituser(UserRepository $userRepository, Request $request) {
		$user = $userRepository->findOneBy(['id' => $this->getUser()->getId()]);
		$form = $this->createFormBuilder($user)
			->add('telephone')
			->add('address')
			->add('Update', SubmitType::class, [
				'attr' => ['class' => 'save btn btn-success'],
			])
			->getForm();

		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {

			$em = $this->getDoctrine()->getManager();
			$em->persist($user);
			$em->flush();
			return $this->redirectToRoute('edituser');
		} else {
			return $this->render('register/edit.html.twig', [
				'form' => $form->createView(),
			]);
		}
		return $this->render('register/edit.html.twig', [
			'form' => $form->createView(),
		]);

	}
	/**
	 * @Route("/favoriteadd/{id}", name="favoriteadd")
	 */
	public function favoriteAdd(UserRepository $userRepository, $id) {
		$user = $userRepository->findOneBy(['id' => $this->getUser()->getId()]);
		$a = $user->getFavorites();
		$test = explode(',', $a);
		if (($key = array_search($id, $test)) !== false) {
			return $this->redirectToRoute('allfavorites');
		}
		$a .= ',' . $id;
		$user->setFavorites($a);

		$em = $this->getDoctrine()->getManager();
		$em->persist($user);
		$em->flush();
		return $this->redirectToRoute('allfavorites');
	}

	/**
	 * @Route("/favoriteremove/{id}", name="favoriteremove")
	 */
	public function favoriteRemove(UserRepository $userRepository, $id) {
		$user = $userRepository->findOneBy(['id' => $this->getUser()->getId()]);
		$a = $user->getFavorites();
		$test = explode(',', $a);
		if (($key = array_search($id, $test)) !== false) {
			unset($test[$key]);
		}
		$a = implode(',', $test);
		$user->setFavorites($a);

		$em = $this->getDoctrine()->getManager();
		$em->persist($user);
		$em->flush();
		return $this->redirectToRoute('allfavorites');
	}

}
