<?php

namespace App\Controller;
use App\Entity\Ads;
use App\Form\AdsType;
use App\Repository\AdsRepository;
use App\Repository\ModelsRepository;
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
	public function index(AdsRepository $adsRepository): Response {
		return $this->render('ads/index.html.twig', [
			'ads' => $adsRepository->findAll(),
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

		if ($form->isSubmitted() && $form->isValid()) {

			$date = new DateTime();

			$ad->setEquipment($form->getData()->getEquipment());

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
			$ad->setContact($imgjson);

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
	public function show(Ads $ad): Response {
		return $this->render('ads/show.html.twig', [
			'ad' => $ad,
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
