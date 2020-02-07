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
	public function register(Request $request, UserPasswordEncoderInterface $encoder, UserRepository $userRepository): Response{
		$form = $this->createFormBuilder()
			->add('username', TextType::class)
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

				$user = new User;
				$user->setUsername($form->getData()['username']);
				$user->setPassword($encoder->encodePassword($user, $form->getData()['password']));
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
}
