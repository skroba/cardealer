<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ModelsRepository")
 */
class Models {
	/**
	 * @ORM\Id()
	 * @ORM\GeneratedValue()
	 * @ORM\Column(type="integer")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $vehicle;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $maker;

	/**
	 * @ORM\Column(type="text", nullable=true)
	 */
	private $model;

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

	public function setModel( ? string $model) : self{
		$this->model = $model;

		return $this;
	}

	public function __toString() {
		return $this->getMaker();
	}

	public function getVehicle() :  ? string {
		return $this->vehicle;
	}

	public function setVehicle(string $vehicle) : self{
		$this->vehicle = $vehicle;

		return $this;
	}
}
