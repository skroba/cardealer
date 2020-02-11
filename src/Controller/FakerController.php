<?php

namespace App\Controller;
use App\Entity\Addresses;
use Faker;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class FakerController extends AbstractController {
	/**
	 * @Route("/faker", name="faker")
	 */
	public function faker() {
		$faker = Faker\Factory::create();
		$em = $this->getDoctrine()->getManager();
		for ($i = 0; $i < 50; $i++) {
			$addresses = new Addresses;
			$addresses->setName($faker->firstName);
			$addresses->setSurname($faker->lastName);
			$addresses->setAddress($faker->address);
			$addresses->setOwner($this->getUser());
			$em->persist($addresses);
			$em->flush();
		}

		return $this->render('faker/index.html.twig', [
			'controller_name' => 'FakerController',
		]);
	}

}
