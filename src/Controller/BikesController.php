<?php

namespace App\Controller;

use App\Entity\Bikes;
use App\Form\BikesType;
use App\Repository\BikesRepository;
use App\Repository\ModelsRepository;
use App\Repository\UserRepository;
use DateTime;
use Intervention\Image\ImageManager;
use Intervention\Image\ImageManager as Image;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/bikes")
 */
class BikesController extends AbstractController {
	/**
	 * @Route("/index{pagination?}", name="bikes_index", requirements={"pagination"="\d+"}, methods={"GET"})
	 */
	public function index(BikesRepository $bikesRepository, ModelsRepository $modelsRepository, $pagination): Response {
		if (!empty($pagination)) {
			$pagination = $pagination * 12;
		}

		return $this->render('bikes/index.html.twig', [
			'count' => $bikesRepository->findAll(),
			'bikes' => $bikesRepository->findBy([], ['id' => 'DESC'], 12, $pagination),
			'models' => $modelsRepository->findBy(['vehicle' => 'bike']),
		]);
	}
	/**
	 * @Route("/test", name="test", methods={"GET"})
	 */
	public function test(): Response{
		// create new Intervention Image
		$manager = new ImageManager(array('driver' => 'gd'));
		$manager = $manager->make('http://www.localhost.test/cardealer/public/images/1582643519/746286e9615f6fcf5573b8a3d22e8b5e.jpeg');

		// paste another image
		// $img->insert('https://lilly021.com/wp-content/uploads/2019/02/logo2.png');

		// create a new Image instance for inserting
		// $watermark = Image::make('https://lilly021.com/wp-content/uploads/2019/02/logo2.png');
		// $img->insert($watermark, 'center')->save($this->getParameter('uploads_dir') . '/small-aca.jpg');

		// insert watermark at bottom-right corner with 10px offset
		$manager->insert('https://lilly021.com/wp-content/uploads/2019/02/logo2.png', 'center')->save($this->getParameter('uploads_dir') . '/small-aca.jpg', 80, 'jpg');
		$manager = '';
		dump($manager);die;
		return $this->render('bikes/show.html.twig', [

		]);
	}

	/**
	 * @Route("/search/{pagination?}", name="bikes_search", methods={"GET"})
	 */
	public function search(BikesRepository $bikesRepository, Request $request, ModelsRepository $modelsRepository, $pagination): Response{

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
			$ads = $bikesRepository->findBy($query, [$test[0] => $test[1]]);
		} else {
			$ads = $bikesRepository->findBy($query);
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

		return $this->render('bikes/search.html.twig', [
			'count' => $ads,
			'ads' => array_slice($ads, $pagination, 12),
			'models' => $modelsRepository->findAll(),
		]);
	}

	/**
	 * @Route("/new", name="bikes_new", methods={"GET","POST"})
	 */
	public function new (Request $request, ModelsRepository $modelsRepository): Response{
		$ad = new Bikes();
		$models = $modelsRepository->findBy(['vehicle' => 'bike']);
		$model = [];
		foreach ($models as $item) {
			$c = ([$item->getMaker() => $item->getMaker()]);
			$model = array_merge($model, $c);
		}
		ksort($model);
		$form = $this->createForm(BikesType::class, $ad, ['model' => $model]);

		$form->handleRequest($request);
		if ($form->isSubmitted()) {
			$date = new DateTime();

			$ad->setEquipment($form->getData()->getEquipment());
			$ad->setModel($form->get('model')->getViewData());
			$folder = $date->getTimestamp();

			$imgjson = [];

			foreach ($form->getData()->getPictures() as $file) {
				$filename = md5(uniqid()) . '.' . $file->guessClientExtension();
				$file->move($this->getParameter('uploads_dir') . '/' . $folder, $filename);
				$manager = new ImageManager(array('driver' => 'gd'));
				$image = $manager->make($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename)->resize(300, 200)
					->save($this->getParameter('uploads_dir') . '/' . $folder . '/' . 'small-' . $filename);
				$manager = $manager->make($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename);
				$manager->insert('https://lilly021.com/wp-content/uploads/2019/02/logo2.png', 'center')->save($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename);
				$manager = '';
				$imgjson[] = $folder . '/' . $filename;

			}

			$ad->setPictures($imgjson);
			$ad->setContact($this->getUser()->getId());
			$ad->setAdded($folder);
			$entityManager = $this->getDoctrine()->getManager();
			$entityManager->persist($ad);
			$entityManager->flush();
			$lastid = $ad->getId();

			return $this->redirectToRoute('bikes_show', ['id' => $lastid]);
		}

		return $this->render('ads/new.html.twig', [
			'ad' => $ad,
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="bikes_show", methods={"GET"})
	 */
	public function show(Bikes $bike, userRepository $userRepository, $id): Response{
		$fav = '';
		if (!empty($this->getUser())) {
			$user = $userRepository->findOneBy(['id' => $this->getUser()->getId()]);
			$a = json_decode($user->getFavorites());

			if (isset($a->bikes) && ($key = array_search($id, $a->bikes)) !== false) {
				$fav = true;
			}
		} else {
			$fav = false;
		}
		// dump($fav);die;

		return $this->render('bikes/show.html.twig', [
			'ad' => $bike,
			'contact' => $userRepository->findOneBy(['id' => $bike->getContact()]),
			'favorites' => $fav,
		]);
	}

	/**
	 * @Route("/{id}/edit", name="bikes_edit", methods={"GET","POST"})
	 */
	public function edit(Request $request, Bikes $bikes, BikesRepository $bikesRepository, $id): Response{
		$test = $bikesRepository->findOneBy(['id' => $id]);
		$pictures = $test->getPictures();
		// dump($pictures);die;
		$form = $this->createFormBuilder($bikes)
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

		if ($bikes->getContact() != $this->getUser()->getId()) {
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

			$imgjson = [];
			foreach ($form->getData()->getPictures() as $file) {
				$filename = md5(uniqid()) . '.' . $file->guessClientExtension();
				$file->move($this->getParameter('uploads_dir') . '/' . $folder, $filename);
				$manager = new ImageManager(array('driver' => 'gd'));
				$image = $manager->make($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename)->resize(300, 200)
					->save($this->getParameter('uploads_dir') . '/' . $folder . '/' . 'small-' . $filename);
				$manager = $manager->make($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename);
				$manager->insert('https://lilly021.com/wp-content/uploads/2019/02/logo2.png', 'center')->save($this->getParameter('uploads_dir') . '/' . $folder . '/' . $filename);
				$manager = '';
				$imgjson[] = $folder . '/' . $filename;

			}

			$pictures = array_merge($pictures, $imgjson);
			// dump($pictures);
			// dump($pictures);die;
			$bikes->setPictures($pictures);
			$this->getDoctrine()->getManager()->flush();

			return $this->redirectToRoute('bikes_show', ['id' => $bikes->getId()]);
		}

		return $this->render('bikes/edit.html.twig', [
			'ad' => $bikes,
			'form' => $form->createView(),
		]);
	}

	/**
	 * @Route("/{id}", name="bikes_delete", methods={"DELETE"})
	 */
	public function delete(Request $request, Bikes $bike): Response {
		if ($this->isCsrfTokenValid('delete' . $bike->getId(), $request->request->get('_token'))) {
			$entityManager = $this->getDoctrine()->getManager();
			$entityManager->remove($bike);
			$entityManager->flush();
		}

		return $this->redirectToRoute('bikes_index');
	}

	/**
	 * @Route("/imageletete/{id}/{image}", name="bikes_image_delete")
	 */
	public function imageDelete($id, $image, BikesRepository $bikesRepository): Response{
		$ad = $bikesRepository->findOneBy(['id' => $id]);

		$pictures = $ad->getPictures();
		unset($pictures[$image]);
		$ad->setPictures(array_values($pictures));
		$entityManager = $this->getDoctrine()->getManager();
		$entityManager->persist($ad);
		$entityManager->flush();
		$lastid = $ad->getId();

		return $this->redirectToRoute('bikes_edit', ['id' => $ad->getId()]);
	}

	/**
	 * @Route("/imageprofile/{id}/{image}", name="bikes_image_profile")
	 */
	public function imageProfile($id, $image, BikesRepository $bikesRepository): Response{
		$ad = $bikesRepository->findOneBy(['id' => $id]);

		$pictures = $ad->getPictures();
		array_unshift($pictures, $pictures[$image]);
		unset($pictures[$image + 1]);
		$pictures = array_values($pictures);
		$ad->setPictures(array_values($pictures));
		$entityManager = $this->getDoctrine()->getManager();
		$entityManager->persist($ad);
		$entityManager->flush();
		$lastid = $ad->getId();

		return $this->redirectToRoute('bikes_edit', ['id' => $ad->getId()]);
	}
}
