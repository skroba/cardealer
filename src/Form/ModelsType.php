<?php

namespace App\Form;

use App\Entity\Models;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ModelsType extends AbstractType {
	public function buildForm(FormBuilderInterface $builder, array $options) {
		$builder
			->add('vehicle', ChoiceType::class, [
				'choices' => [
					'car' => 'car',
					'bike' => 'bike',
					'truck' => 'truck',
				],
			])
			->add('maker')
			->add('model')
		;
	}

	public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
			'data_class' => Models::class,
		]);
	}
}
