<?php

namespace App\Controller;
use App\Entity\Addresses;
use App\Form\AddressesType;
use App\Repository\AddressesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/addresses")
 */
class AddressesController extends AbstractController {
	/**
	 * @Route("/", name="addresses_index", methods={"GET"})
	 */
	public function index(AddressesRepository $addressesRepository): Response{
		$user = $this->getUser()->getId();
		return $this->render('addresses/index.html.twig', [
			'addresses' => $addressesRepository->findInMultipleFields('', $user),
		]);
	}

	/**
	 * @Route("/search/{query?}/{pagination?}", name="search", methods={"GET","POST"})
	 */
	public function search($query, $pagination, Request $request, AddressesRepository $addressesRepository): Response{
		$user = $this->getUser()->getId();
		$form = $this->createFormBuilder()
			->add('search', TextType::class)
			->add('button', SubmitType::class, ['label' => 'Find'])
			->getForm();
		$form->handleRequest($request);

		if ($form->isSubmitted()) {
			$data = $addressesRepository->findInMultipleFields($form->getData()['search'], $user);
			// dump($data);die;
			return $this->render('addresses/search.html.twig', [
				'data' => $data,
				'pagination' => 0,
				'query' => $form->getData()['search'],
			]);
		}

		if (!empty($query) && isset($pagination)) {
			$data = $addressesRepository->findInMultipleFields($query, $user);
			return $this->render('addresses/search.html.twig', [
				'data' => $data,
				'pagination' => $pagination,
				'query' => $query,
			]);
		}

		return $this->render('addresses/search.html.twig', [
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/new", name="addresses_new", methods={"GET","POST"})
	 */
	public function new (Request $request): Response{
		$address = new Addresses();
		$form = $this->createForm(AddressesType::class, $address);
		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {
			$entityManager = $this->getDoctrine()->getManager();
			$address->setOwner($this->getUser());
			$entityManager->persist($address);
			$entityManager->flush();

			return $this->redirectToRoute('addresses_index');
		}

		return $this->render('addresses/new.html.twig', [
			'address' => $address,
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="addresses_show", methods={"GET"})
	 */
	public function show(Addresses $address): Response {
		return $this->render('addresses/show.html.twig', [
			'address' => $address,
		]);
	}

	/**
	 * @Route("/{id}/edit", name="addresses_edit", methods={"GET","POST"})
	 */
	public function edit(Request $request, Addresses $address): Response{
		$form = $this->createForm(AddressesType::class, $address);
		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {
			$this->getDoctrine()->getManager()->flush();

			return $this->redirectToRoute('addresses_index');
		}

		return $this->render('addresses/edit.html.twig', [
			'address' => $address,
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="addresses_delete", methods={"DELETE"})
	 */
	public function delete(Request $request, Addresses $address): Response {
		if ($this->isCsrfTokenValid('delete' . $address->getId(), $request->request->get('_token'))) {
			$entityManager = $this->getDoctrine()->getManager();
			$entityManager->remove($address);
			$entityManager->flush();
		}

		return $this->redirectToRoute('addresses_index');
	}

}
