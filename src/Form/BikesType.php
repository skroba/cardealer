<?php

namespace App\Form;

use App\Entity\Bikes;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class BikesType extends AbstractType {
	public function buildForm(FormBuilderInterface $builder, array $options) {
		$builder
			->add('maker', ChoiceType::class, [
				'label' => 'Choose model',
				'choices' => $options['model'],
			])
			->add('model', ChoiceType::class, [
				'choices' => [
					'Scooter' => 'Scooter',
					'Naked' => 'Naked',
					'Chopper' => 'Chopper',
					'Oldtimer' => 'Oldtimer',
					'Enduro' => 'Enduro',
					'Sport' => 'Sport',
					'Cross' => 'Cross',
				],
			])
			->add('label')
			->add('volume')
			->add('hp')
			->add('cylinders')
			->add('cooling', ChoiceType::class, [
				'choices' => [
					'air respirated' => 'air respirated',
					'liquid' => 'liquid',
				],
			])
			->add('transmission', ChoiceType::class, [
				'choices' => [
					'chain' => 'chain',
					'axle' => 'axle',
				],
			])
			->add('price')
			->add('mileage')
			->add('year')
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
			->add('insurance', ChoiceType::class, [
				'choices' => [
					'without' => 'without',
					'01/2020' => '01/2020',
					'02/2020' => '02/2020',
					'03/2020' => '03/2020',
					'04/2020' => '04/2020',
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
					'ABS' => 'ABS',
					'Navigation' => 'Navigation',
					'Wind shield' => 'Wind shield',
					'Helmet' => 'Helmet',
				],
			])
			->add('about')
		;
	}

	public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
			'data_class' => Bikes::class,
			'model' => null,
		]);
	}
}
