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
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/ads")
 */
class AdsController extends AbstractController {
	/**
	 * @Route("/all/{pagination?}", name="ads_index", requirements={"pagination"="\d+"}, methods={"GET"})
	 */
	public function index(AdsRepository $adsRepository, ModelsRepository $modelsRepository, $pagination): Response {
		if (!empty($pagination)) {
			$pagination = $pagination * 12;
		}

		return $this->render('ads/index.html.twig', [
			'count' => $adsRepository->findAll(),
			'ads' => $adsRepository->findBy([], ['id' => 'DESC'], 12, $pagination),
			'models' => $modelsRepository->findAll(),
			'pagination' => 'index'
		]);
	}

	/**
	 * @Route("/search/{pagination?}", name="search", methods={"GET"})
	 */
	public function search(AdsRepository $adsRepository, Request $request, ModelsRepository $modelsRepository, $pagination): Response{

		$request = Request::createFromGlobals();

		$query = $request->query->all();
		if (!empty($query['sort'])) {
			$test = explode(' ', $query['sort']);
			// dump($test);die;
		} else {
			$test = [];
		}

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

		unset($query['yearfrom'], $query['yearto'], $query['price'], $query['mileage'], $query['sort']);
		foreach ($query as $key => $value) {
			if ($value == "") {
				unset($query[$key]);}
		}

		if (!empty($test)) {
			$ads = $adsRepository->findBy($query, [$test[0] => $test[1]]);
		} else {
			$ads = $adsRepository->findBy($query);
		}

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
		if (!empty($pagination)) {
			$pagination = $pagination * 12;
		}

		return $this->render('ads/search.html.twig', [
			'count' => $ads,
			'ads' => array_slice($ads, $pagination, 12),
			'models' => $modelsRepository->findAll(),
			'pagination' => 'search',
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
			$lastid = $ad->getId();

			return $this->redirectToRoute('ads_show', ['id' => $lastid]);
		}

		return $this->render('ads/new.html.twig', [
			'ad' => $ad,
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="ads_show",requirements={"id"="\d+"}, methods={"GET"})
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
	public function edit(Request $request, Ads $ad, AdsRepository $adsRepository, $id): Response{
		$test = $adsRepository->findOneBy(['id' => $id]);
		$pictures = $test->getPictures();
		// dump($pictures);die;
		$form = $this->createFormBuilder($ad)
			->add('pictures', FileType::class, [
				'multiple' => true,
				'required' => false,
				'attr' => [
					'accept' => 'image/*',
					'multiple' => 'multiple',
				],
			])
			->add('price')
			->add('about')

			->getForm();
		$form->handleRequest($request);

		if ($ad->getContact() != $this->getUser()->getId()) {
			return $this->redirectToRoute('app_login');
		}

		if ($form->isSubmitted()) {
			// dump($ad);die;
			if (!empty($pictures)) {
				$folder = substr($pictures[0], 0, 10);
			} else {
				$date = new DateTime();
				$folder = $date->getTimestamp();
			}

			$manager = new ImageManager(array('driver' => 'gd'));
			$imgjson = [];
			foreach ($form->getData()->getPictures() as $file) {
				$filename = md5(uniqid()) . '.' . $file->guessClientExtension();
				$file->move($this->getParameter('uploads_dir') . '/' . $folder, $filename);
				$image = $manager->make($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename)->resize(300, 200)
					->save($this->getParameter('uploads_dir') . '/' . $folder . '/' . 'small-' . $filename);
				$imgjson[] = $folder . '/' . $filename;

			}
			dump($pictures);
			$pictures = array_merge($pictures, $imgjson);
			// dump($pictures);
			// dump($pictures);die;
			$ad->setPictures($pictures);
			$this->getDoctrine()->getManager()->flush();

			return $this->redirectToRoute('ads_show', ['id' => $ad->getId()]);
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

	/**
	 * @Route("/imageletete/{id}/{image}", name="ads_image_delete")
	 */
	public function imageDelete($id, $image, AdsRepository $adsRepository): Response{
		$ad = $adsRepository->findOneBy(['id' => $id]);

		$pictures = $ad->getPictures();
		unset($pictures[$image]);
		$ad->setPictures(array_values($pictures));
		$entityManager = $this->getDoctrine()->getManager();
		$entityManager->persist($ad);
		$entityManager->flush();
		$lastid = $ad->getId();

		return $this->redirectToRoute('ads_edit', ['id' => $ad->getId()]);
	}

	/**
	 * @Route("/favorites/", name="allfavorites", methods={"GET"})
	 */
	public function favorites(AdsRepository $adsRepository, UserRepository $userRepository): Response{
		$user = $userRepository->findOneBy(['id' => $this->getUser()->getId()]);
		// if (!empty($pagination)) {
		// 	$pagination = $pagination * 12;
		// }
		$ads = explode(',', $user->getFavorites());
		$test = [];
		foreach ($ads as $key => $value) {
			$test = array_merge($test, $adsRepository->findBy(['id' => $value]));
		}

		return $this->render('ads/favorites.html.twig', [

			'ads' => array_reverse($test),

		]);
	}
}
