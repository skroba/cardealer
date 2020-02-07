<?php

namespace App\Form;

use App\Entity\Addresses;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AddressesType extends AbstractType {
	public function buildForm(FormBuilderInterface $builder, array $options) {
		$builder
			->add('name')
			->add('surname')
			->add('address')
		;
	}

	public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
			'data_class' => Addresses::class,
		]);
	}
}
