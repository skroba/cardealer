<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass="App\Repository\UserRepository")
 */
class User implements UserInterface {
	/**
	 * @ORM\Id()
	 * @ORM\GeneratedValue()
	 * @ORM\Column(type="integer")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string", length=180, unique=true)
	 */
	private $username;
	/**
	 * @ORM\Column(type="string", length=180)
	 */
	private $telephone;

	/**
	 * @ORM\Column(type="text")
	 */
	private $address;

	/**
	 * @ORM\Column(type="json")
	 */
	private $roles = [];

	/**
	 * @var string The hashed password
	 * @ORM\Column(type="string")
	 */
	private $password;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $email;

	/**
	 * @ORM\Column(type="text")
	 */
	private $favorites;

	/**
	 * @ORM\Column(type="string", length=255)
	 */
	private $authenticated;

	/**
	 * A visual identifier that represents this user.
	 *
	 * @see UserInterface
	 */
	public function getUsername(): string {
		return (string) $this->username;
	}

	public function setUsername(string $username): self{
		$this->username = $username;

		return $this;
	}

	/**
	 * @see UserInterface
	 */
	public function getRoles(): array
	{
		$roles = $this->roles;
		// guarantee every user at least has ROLE_USER
		$roles[] = 'ROLE_USER';

		return array_unique($roles);
	}

	public function setRoles(array $roles): self{
		$this->roles = $roles;

		return $this;
	}

	/**
	 * @see UserInterface
	 */
	public function getPassword(): string {
		return (string) $this->password;
	}

	public function setPassword(string $password): self{
		$this->password = $password;

		return $this;
	}

	/**
	 * @see UserInterface
	 */
	public function getSalt() {
		// not needed when using the "bcrypt" algorithm in security.yaml
	}

	/**
	 * @see UserInterface
	 */
	public function eraseCredentials() {
		// If you store any temporary, sensitive data on the user, clear it here
		// $this->plainPassword = null;
	}

	public function getEmail():  ? string {
		return $this->email;
	}

	public function setEmail(string $email) : self{
		$this->email = $email;

		return $this;
	}

	public function getAuthenticated():  ? string {
		return $this->authenticated;
	}

	public function setAuthenticated(string $authenticated) : self{
		$this->authenticated = $authenticated;

		return $this;
	}

	public function getId():  ? int {
		return $this->id;
	}

	public function getTelephone() :  ? string {
		return $this->telephone;
	}

	public function setTelephone(string $telephone) : self{
		$this->telephone = $telephone;

		return $this;
	}

	public function getAddress():  ? string {
		return $this->address;
	}

	public function setAddress(string $address) : self{
		$this->address = $address;

		return $this;
	}

	public function getFavorites():  ? string {
		return $this->favorites;
	}

	public function setFavorites(string $favorites) : self{
		$this->favorites = $favorites;

		return $this;
	}

}
