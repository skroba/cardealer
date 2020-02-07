<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\AddressesRepository")
 */
class Addresses {
	/**
	 * @ORM\Id()
	 * @ORM\GeneratedValue()
	 * @ORM\Column(type="integer")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", length=255, nullable=true)
	 */
	private $name;

	/**
	 * @ORM\Column(type="string", length=255, nullable=true)
	 */
	private $surname;

	/**
	 * @ORM\Column(type="string", length=255, nullable=true)
	 */
	private $address;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\User", inversedBy="addresses")
     * @ORM\JoinColumn(nullable=false)
     */
    private $owner;

	public function getId():  ? int {
         		return $this->id;
         	}

	public function getName() :  ? string {
         		return $this->name;
         	}

	public function setName( ? string $name) : self{
         		$this->name = $name;
         
         		return $this;
         	}

	public function getSurname() :  ? string {
         		return $this->surname;
         	}

	public function setSurname( ? string $surname) : self{
         		$this->surname = $surname;
         
         		return $this;
         	}

	public function getAddress() :  ? string {
         		return $this->address;
         	}

	public function setAddress( ? string $address) : self{
         		$this->address = $address;
         
         		return $this;
         	}

    public function getOwner(): ?User
    {
        return $this->owner;
    }

    public function setOwner(?User $owner): self
    {
        $this->owner = $owner;

        return $this;
    }
}
