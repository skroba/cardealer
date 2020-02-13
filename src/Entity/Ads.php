<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AdsRepository")
 */
class Ads {
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
	 * @ORM\Column(type="string", length=255)
	 */
	private $fuel;

	/**
	 * @ORM\Column(type="integer", nullable=true)
	 */
	private $volume;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $price;

	/**
	 * @ORM\Column(type="integer")
	 */
	private $year;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $body;

	/**
	 * @ORM\Column(type="json", nullable=true)
	 */
	private $pictures = [];

	/**
	 * @ORM\Column(type="json", nullable=true)
	 */
	private $equipment = [];

	/**
	 * @ORM\Column(type="text")
	 */
	private $about;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $door;

	/**
	 * @ORM\Column(type="string")
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

	public function getFuel():  ? string {
      		return $this->fuel;
      	}

	public function setFuel(string $fuel) : self{
      		$this->fuel = $fuel;
      
      		return $this;
      	}

	public function getVolume():  ? int {
      		return $this->volume;
      	}

	public function setVolume( ? int $volume) : self{
      		$this->volume = $volume;
      
      		return $this;
      	}

	public function getPrice() :  ? int {
      		return $this->price;
      	}

	public function setPrice(int $price) : self{
      		$this->price = $price;
      
      		return $this;
      	}

	public function getYear():  ? int {
      		return $this->year;
      	}

	public function setYear(int $year) : self{
      		$this->year = $year;
      
      		return $this;
      	}

	public function getBody():  ? string {
      		return $this->body;
      	}

	public function setBody(string $body) : self{
      		$this->body = $body;
      
      		return $this;
      	}

	public function getPictures():  ? array
      	{
      		return $this->pictures;
      	}

	public function setPictures( ? array $pictures) : self{
      		$this->pictures = $pictures;
      
      		return $this;
      	}

	public function getEquipment() :  ? array
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

	public function setAbout(string $about) : self{
      		$this->about = $about;
      
      		return $this;
      	}

	public function getDoor():  ? string {
      		return $this->door;
      	}

	public function setDoor(string $door) : self{
      		$this->door = $door;
      
      		return $this;
      	}

	public function getContact():  ? string {
      		return $this->contact;
      	}

	public function setContact(string $contact) : self{
      		$this->contact = $contact;
      
      		return $this;
      	}

    public function getAdded(): ?string
    {
        return $this->added;
    }

    public function setAdded(string $added): self
    {
        $this->added = $added;

        return $this;
    }
}
