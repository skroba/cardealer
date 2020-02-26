<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\BikesRepository")
 */
class Bikes {
	/**
	 * @ORM\Id()
	 * @ORM\GeneratedValue()
	 * @ORM\Column(type="integer")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $maker;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $model;

	/**
	 * @ORM\Column(type="string", length=255, nullable=true)
	 */
	private $label;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $volume;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $hp;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $cylinders;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $cooling;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $transmission;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $price;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $mileage;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $year;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $color;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $insurance;

	/**
	 * @ORM\Column(type="json")
	 */
	private $pictures = [];

	/**
	 * @ORM\Column(type="json", nullable=true)
	 */
	private $equipment = [];

	/**
	 * @ORM\Column(type="text", nullable=true)
	 */
	private $about;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $contact;

	/**
	 * @ORM\Column(type="string")
	 */
	private $added;

	public function getId():  ? int {
		return $this->id;
	}

	public function getMaker() :  ? string {
		return $this->maker;
	}

	public function setMaker(string $maker) : self{
		$this->maker = $maker;

		return $this;
	}

	public function getModel():  ? string {
		return $this->model;
	}

	public function setModel(string $model) : self{
		$this->model = $model;

		return $this;
	}

	public function getLabel():  ? string {
		return $this->label;
	}

	public function setLabel( ? string $label) : self{
		$this->label = $label;

		return $this;
	}

	public function getVolume() :  ? int {
		return $this->volume;
	}

	public function setVolume(int $volume) : self{
		$this->volume = $volume;

		return $this;
	}

	public function getHp():  ? int {
		return $this->hp;
	}

	public function setHp(int $hp) : self{
		$this->hp = $hp;

		return $this;
	}

	public function getCylinders():  ? int {
		return $this->cylinders;
	}

	public function setCylinders(int $cylinders) : self{
		$this->cylinders = $cylinders;

		return $this;
	}

	public function getCooling():  ? string {
		return $this->cooling;
	}

	public function setCooling(string $cooling) : self{
		$this->cooling = $cooling;

		return $this;
	}

	public function getTransmission():  ? string {
		return $this->transmission;
	}

	public function setTransmission(string $transmission) : self{
		$this->transmission = $transmission;

		return $this;
	}

	public function getPrice():  ? int {
		return $this->price;
	}

	public function setPrice(int $price) : self{
		$this->price = $price;

		return $this;
	}

	public function getMileage():  ? int {
		return $this->mileage;
	}

	public function setMileage(int $mileage) : self{
		$this->mileage = $mileage;

		return $this;
	}

	public function getYear():  ? int {
		return $this->year;
	}

	public function setYear(int $year) : self{
		$this->year = $year;

		return $this;
	}

	public function getColor():  ? string {
		return $this->color;
	}

	public function setColor(string $color) : self{
		$this->color = $color;

		return $this;
	}

	public function getInsurance():  ? string {
		return $this->insurance;
	}

	public function setInsurance(string $insurance) : self{
		$this->insurance = $insurance;

		return $this;
	}

	public function getPictures():  ? array
	{
		return $this->pictures;
	}

	public function setPictures(array $pictures) : self{
		$this->pictures = $pictures;

		return $this;
	}

	public function getEquipment():  ? array
	{
		return $this->equipment;
	}

	public function setEquipment( ? array $equipment) : self{
		$this->equipment = $equipment;

		return $this;
	}

	public function getAbout() :  ? string {
		return $this->about;
	}

	public function setAbout( ? string $about) : self{
		$this->about = $about;

		return $this;
	}

	public function getContact() :  ? int {
		return $this->contact;
	}

	public function setContact(int $contact) : self{
		$this->contact = $contact;

		return $this;
	}

	public function getAdded():  ? string {
		return $this->added;
	}

	public function setAdded( ? string $added) : self{
		$this->added = $added;

		return $this;
	}
}
