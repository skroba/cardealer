<?php

namespace App\Form;

use App\Entity\Ads;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AdsType extends AbstractType {
	public function buildForm(FormBuilderInterface $builder, array $options) {

		$builder
			->add('maker', ChoiceType::class, [
				'label' => 'Choose model',
				'choices' => $options['model'],
			])
			->add('model', ChoiceType::class)
			->add('label')
			->add('fuel', ChoiceType::class, [
				'choices' => [
					'gasoline' => 'gasoline',
					'diesel' => 'diesel',
					'LPG' => 'LPG',
					'hybrid' => 'hybrid',
					'electro' => 'electro',
				],
			])
			->add('volume')
			->add('hp')
			->add('mileage')
			->add('gearchange', ChoiceType::class, [
				'choices' => [
					'5 speed manual' => '5 speed manual',
					'56 speed manual' => '6 speed manual',
					'automatic' => 'automatic',
				],
			])
			->add('euro', ChoiceType::class, [
				'choices' => [
					'euro2' => 'euro2',
					'euro3' => 'euro3',
					'euro4' => 'euro4',
					'euro5' => 'euro5',
					'euro6' => 'euro6',
				],
			])
			->add('price')
			->add('year')
			->add('door', ChoiceType::class, [
				'choices' => [
					'2/3' => '2/3',
					'4/5' => '4/5',
				],
			])
			->add('body', ChoiceType::class, [
				'choices' => [
					'hatchback' => 'hatchback',
					'estate' => 'estate',
					'limousine' => 'limousine',
					'cabrio' => 'cabrio',
					'suv' => 'suv',
				],
			])
			->add('drive', ChoiceType::class, [
				'choices' => [
					'fwd' => 'fwd',
					'rwd' => 'rwd',
					'awd' => 'awd',
				],
			])
			->add('insurance', ChoiceType::class, [
				'choices' => [
					'without' => 'without',
					'01/2020' => '01/2020',
					'02/2020' => '02/2020',
					'03/2020' => '03/2020',
					'04/2020' => '04/2020',
				],
			])
			->add('seats', ChoiceType::class, [
				'choices' => [
					'1' => '1',
					'2' => '2',
					'3' => '3',
					'4' => '4',
					'5' => '5',
					'7' => '7',
				],
			])
			->add('aircon', ChoiceType::class, [
				'choices' => [
					'none' => 'none',
					'manual' => 'manual',
					'automatic' => 'automatic',
				],
			])
			->add('color', ChoiceType::class, [
				'choices' => [
					'white' => 'white',
					'black' => 'black',
					'blue' => 'blue',
					'green' => 'green',
					'red' => 'red',
					'yellow' => 'yellow',
					'orange' => 'orange',
				],
			])
			->add('pictures', FileType::class, [
				'multiple' => true,
				'attr' => [
					'accept' => 'image/*',
					'multiple' => 'multiple',
				],
			])
			->add('equipment', ChoiceType::class, [
				'multiple' => true,
				'expanded' => true,
				'choices' => [
					'Alloy wheels' => 'Alloy wheels',
					'Navigation' => 'Navigation',
					'Radio' => 'Radio',
					'Camera' => 'Camera',
					'Sunroof' => 'Sunroof',
					'Usb' => 'Usb',
					'Board computer' => 'Board computer',
					'Isofix' => 'Isofix',
					'Bluetooth' => 'Bluetooth',
					'Sunroof' => 'Sunroof',
				],
			])
			->add('security', ChoiceType::class, [
				'multiple' => true,
				'expanded' => true,
				'choices' => [
					'Alarm' => 'Alarm',
					'Airbags' => 'Airbags',
					'ABS' => 'ABS',
					'Asr' => 'Asr',
					'Fog lights' => 'Fog lights',
					'Esp' => 'Esp',
				],
			])
			->add('about')
		;
		// $builder->get('maker')->addEventListener(
		// 	FormEvents::POST_SUBMIT,
		// 	function (FormEvent $event) {
		// 		$test = '';
		// 		$form = $event->getForm();
		// 		$this->setModelForCar(
		// 			$form->getParent(),
		// 			$event->getData()
		// 		);
		// 	}
		// );
	}
	// public function setModelForCar(FormInterface $form,  ? string $model) {
	// 	$form->add('model', ChoiceType::class, [
	// 		'placeholder' => 'Where exactly?',
	// 		'choices' => ['test' => 'test'],
	// 		'required' => false,
	// 	]);
	// }

	public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
			'data_class' => Ads::class,
			'model' => null,
			'user' => null,
		]);
	}
}
