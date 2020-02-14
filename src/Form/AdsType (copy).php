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
			->add('mileage')
			->add('gearchange', ChoiceType::class, [
				'choices' => [
					'manual' => 'manual',
					'automatic' => 'automatic',
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
		;
	}

	public function configureOptions(OptionsResolver $resolver) {
		$resolver->setDefaults([
			'data_class' => Ads::class,
			'model' => null,
			'user' => null,
		]);
	}
}

$formModifier = function (FormInterface $form, Ad $ad = null) {
	$model = null === $ad ? [] : $ad->getModel();

	$form->add('model', EntityType::class, [
		'class' => 'App\Entity\Models',
		'placeholder' => '',
		'choices' => $model,
	]);
};
$builder->addEventListener(
	FormEvents::PRE_SET_DATA,
	function (FormEvent $event) use ($formModifier) {
		// this would be your entity, i.e. SportMeetup
		$data = $event->getData();

		$formModifier($event->getForm(), $data->getModel());
	}
);

$builder->get('model')->addEventListener(
	FormEvents::POST_SUBMIT,
	function (FormEvent $event) use ($formModifier) {
		// It's important here to fetch $event->getForm()->getData(), as
		// $event->getData() will get you the client data (that is, the ID)
		$ad = $event->getForm()->getData();

		// since we've added the listener to the child, we'll have to pass on
		// the parent to the callback functions!
		$formModifier($event->getForm()->getParent(), $ad);
	}
);