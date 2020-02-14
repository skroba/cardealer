<?php

namespace App\Controller;
use App\Entity\Ads;
use App\Form\AdsType;
use App\Repository\AdsRepository;
use App\Repository\ModelsRepository;
use App\Repository\UserRepository;
use DateTime;
use Intervention\Image\ImageManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/ads")
 */
class AdsController extends AbstractController {
	/**
	 * @Route("/", name="ads_index", methods={"GET"})
	 */
	public function index(AdsRepository $adsRepository, ModelsRepository $modelsRepository): Response {
		return $this->render('ads/index.html.twig', [
			'ads' => $adsRepository->findAll(),
			'models' => $modelsRepository->findAll(),
		]);
	}

	/**
	 * @Route("/search", name="search", methods={"POST"})
	 */
	public function search(AdsRepository $adsRepository, Request $request, ModelsRepository $modelsRepository): Response{

		$request = Request::createFromGlobals();

		$query = $request->request->all();

		if (isset($query['yearfrom'])) {
			$yearfrom = $query['yearfrom'];
		}
		if (isset($query['yearto'])) {
			$yearto = $query['yearto'];
		}
		if (isset($query['mileage'])) {
			$mileage = $query['mileage'];
		}
		if (isset($query['price'])) {
			$price = $query['price'];
		}

		unset($query['yearfrom'], $query['yearto'], $query['price'], $query['mileage']);
		foreach ($query as $key => $value) {
			if ($value == "") {
				unset($query[$key]);}
		}

		$ads = $adsRepository->findBy($query);

		foreach ($ads as $key => $data) {
			if (!empty($price) && $price < $data->getPrice()) {
				unset($ads[$key]);}
			if (!empty($yearfrom) && $yearfrom > $data->getYear()) {
				unset($ads[$key]);}
			if (!empty($yearto) && $yearto < $data->getYear()) {
				unset($ads[$key]);}
			if (!empty($mileage) && $mileage < $data->getMileage()) {
				unset($ads[$key]);}

		}

		return $this->render('ads/index.html.twig', [
			'ads' => $ads,
			'models' => $modelsRepository->findAll(),
		]);
	}

	/**
	 * @Route("/new", name="ads_new", methods={"GET","POST"})
	 */
	public function new (Request $request, ModelsRepository $modelsRepository): Response{
		$ad = new Ads();
		$models = $modelsRepository->findAll();
		$model = [];
		foreach ($models as $item) {
			$c = ([$item->getMaker() => $item->getMaker()]);
			$model = array_merge($model, $c);
		}
		ksort($model);
		$form = $this->createForm(AdsType::class, $ad, ['model' => $model]);

		$form->handleRequest($request);
		if ($form->isSubmitted()) {
			$date = new DateTime();

			$ad->setEquipment($form->getData()->getEquipment());
			$ad->setModel($form->get('model')->getViewData());
			$folder = $date->getTimestamp();

			$manager = new ImageManager(array('driver' => 'gd'));
			$imgjson = [];
			foreach ($form->getData()->getPictures() as $file) {
				$filename = md5(uniqid()) . '.' . $file->guessClientExtension();
				$file->move($this->getParameter('uploads_dir') . '/' . $folder, $filename);
				$image = $manager->make($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename)->resize(300, 200)
					->save($this->getParameter('uploads_dir') . '/' . $folder . '/' . 'small-' . $filename);
				$imgjson[] = $folder . '/' . $filename;

			}

			$ad->setPictures($imgjson);
			$ad->setContact($this->getUser()->getId());
			$ad->setAdded($folder);
			$entityManager = $this->getDoctrine()->getManager();
			$entityManager->persist($ad);
			$entityManager->flush();

			return $this->redirectToRoute('ads_index');
		}

		return $this->render('ads/new.html.twig', [
			'ad' => $ad,
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="ads_show", methods={"GET"})
	 */
	public function show(Ads $ad, userRepository $userRepository): Response {

		return $this->render('ads/show.html.twig', [
			'ad' => $ad,
			'contact' => $userRepository->findOneBy(['id' => $ad->getContact()]),
		]);
	}

	/**
	 * @Route("/{id}/edit", name="ads_edit", methods={"GET","POST"})
	 */
	public function edit(Request $request, Ads $ad, ModelsRepository $modelsRepository): Response{
		$models = $modelsRepository->findAll();
		$models = $modelsRepository->findAll();
		$model = [];
		foreach ($models as $item) {
			$c = ([$item->getMaker() => $item->getMaker()]);
			$model = array_merge($model, $c);
		}
		ksort($model);
		$form = $this->createForm(AdsType::class, $ad, ['model' => $model]);
		$form->handleRequest($request);

		if ($form->isSubmitted() && $form->isValid()) {
			$this->getDoctrine()->getManager()->flush();

			return $this->redirectToRoute('ads_index');
		}

		return $this->render('ads/edit.html.twig', [
			'ad' => $ad,
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="ads_delete", methods={"DELETE"})
	 */
	public function delete(Request $request, Ads $ad): Response {
		if ($this->isCsrfTokenValid('delete' . $ad->getId(), $request->request->get('_token'))) {
			$entityManager = $this->getDoctrine()->getManager();
			$entityManager->remove($ad);
			$entityManager->flush();
		}

		return $this->redirectToRoute('ads_index');
	}
}
