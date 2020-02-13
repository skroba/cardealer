<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ModelsRepository")
 * @UniqueEntity("maker")
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
}
