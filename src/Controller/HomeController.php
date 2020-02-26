<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController {
	/**
	 * @Route("/", name="home")
	 */
	public function index() {
		return $this->redirectToRoute('ads_index');
	}
	/**
	 * @Route("/create", name="create")
	 */
	public function create() {
		return $this->render('home/create.html.twig', [
		]);
	}
}
