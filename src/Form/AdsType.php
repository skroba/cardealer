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
			->add('model')
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
					'Air Condition' => 'Air Condition',
					'Alloy wheels' => 'Alloy wheels',
					'ABS' => 'ABS',
					'Isofix' => 'Isofix',
					'Alarm' => 'Alarm',
					'Sunroof' => 'Sunroof',
				],
			])
			->add('about')
			->add('contact', FileType::class, [
				'multiple' => true,
				'attr' => [
					'accept' => 'image/*',
					'multiple' => 'multiple',
				],
			]);

	}

	public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
			'data_class' => Ads::class,
			'model' => null,
		]);
	}
}
