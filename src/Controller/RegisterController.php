<?php

namespace App\Controller;
use App\Entity\User;
use App\Repository\UserRepository;
use PHPMailer\PHPMailer\PHPMailer;
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
			->add('email', TextType::class)
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
				$user->setEmail($form->getData()['email']);
				$user->setPassword($encoder->encodePassword($user, $form->getData()['password']));
				$em = $this->getDoctrine()->getManager();

				$mail = new PHPMailer();

				$mail->IsSMTP(); // telling the class to use SMTP
				$mail->Host = "smtp.gmail.com"; // SMTP server
				$mail->SMTPDebug = 2; // enables SMTP debug information (for testing)
				// 1 = errors and messages
				// 2 = messages only
				$mail->SMTPAuth = true; // enable SMTP authentication
				$mail->SMTPSecure = "tls";
				$mail->Host = "smtp.gmail.com"; // SMTP server
				$mail->Port = 587; // SMTP port
				$mail->Username = "askrobic@gmail.com"; // username
				$mail->Password = "Gmejl1984!"; // password

				$mail->SetFrom('askrobic@gmail.com', 'Test');

				$mail->Subject = "I hope this works!";

				$mail->MsgHTML('Blah');

				$address = "askrobic@gmail.com";
				$mail->AddAddress($address, "Test");

				if (!$mail->Send()) {
					echo "Mailer Error: " . $mail->ErrorInfo;
				} else {
					echo "Message sent!";
				}
				die;

				$em->persist($user);
				$em->flush();
				//php mailer

				return $this->redirectToRoute('app_login');
			}

		}

		return $this->render('register/index.html.twig', [
			'form' => $form->createView(),
			'message' => 'Register',
		]);
	}
}
