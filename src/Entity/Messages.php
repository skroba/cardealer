<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\MessagesRepository")
 */
class Messages {
	/**
	 * @ORM\Id()
	 * @ORM\GeneratedValue()
	 * @ORM\Column(type="integer")
	 */
	private $id;

	/**
	 * @ORM\Column(type="string")
	 */
	private $sender;

	/**
	 * @ORM\Column(type="string")
	 */
	private $receiver;

	/**
	 * @ORM\Column(type="string")
	 */
	private $ad;

	/**
	 * @ORM\Column(type="text")
	 */
	private $text;

	/**
	 * @ORM\Column(type="datetime")
	 */
	private $timestamp;

	/**
	 * @ORM\Column(type="boolean")
	 */
	private $seen;

	public function getId():  ? int {
		return $this->id;
	}

	public function getSender() :  ? string {
		return $this->sender;
	}

	public function setSender(string $sender) : self{
		$this->sender = $sender;

		return $this;
	}

	public function getReceiver():  ? string {
		return $this->receiver;
	}

	public function setReceiver(string $receiver) : self{
		$this->receiver = $receiver;

		return $this;
	}

	public function getAd():  ? string {
		return $this->ad;
	}

	public function setAd(string $ad) : self{
		$this->ad = $ad;

		return $this;
	}

	public function getText():  ? string {
		return $this->text;
	}

	public function setText(string $text) : self{
		$this->text = $text;

		return $this;
	}

	public function getTimestamp():  ? \DateTimeInterface {
		return $this->timestamp;
	}

	public function setTimestamp(\DateTimeInterface $timestamp) : self{
		$this->timestamp = $timestamp;

		return $this;
	}

	public function getSeen():  ? bool {
		return $this->seen;
	}

	public function setSeen(bool $seen) : self{
		$this->seen = $seen;

		return $this;
	}
}
