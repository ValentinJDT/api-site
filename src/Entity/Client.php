<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Client
 *
 * @ORM\Table(name="client")
 * @ORM\Entity(repositoryClass="App\Repository\ClientRepository")
 * @method string getUserIdentifier()
 */
class Client implements UserInterface, PasswordAuthenticatedUserInterface {

    /**
     * @var int
     *
     * @ORM\Column(name="id_client", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idClient;

    /**
     * @var string
     *
     * @ORM\Column(name="uuid", type="text", length=36, nullable=false)
     */
    private $uuid;

    /**
     * @var string
     *
     * @ORM\Column(name="prenom", type="text", length=65535, nullable=false)
     */
    private $prenom;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="text", length=65535, nullable=false)
     */
    private $nom;

    /**
     * @ORM\Column(name="mail", type="text", length=65535, nullable=false, unique=true)
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="adresse", type="text", length=65535, nullable=false)
     */
    private $adresse;

    /**
     * @var string
     *
     * @ORM\Column(name="cp", type="text", length=65535, nullable=false)
     */
    private $cp;

    /**
     * @var string
     *
     * @ORM\Column(name="ville", type="text", length=65535, nullable=false)
     */
    private $ville;

    /**
     * @var string
     *
     * @ORM\Column(name="tel", type="text", length=65535, nullable=false)
     */
    private $tel;

    /**
     * @var string The hashed password
     * @ORM\Column(name="mot_de_passe", type="text", length=65535, nullable=false)
     */
    private $password;

    /**
     * @ORM\Column(name="roles_jwt", type="json")
     */
    private $roles = [];

    /**
     * @var binary
     *
     * @ORM\Column(name="newsletter", type="binary", nullable=false)
     */
    private $newsletter;

    public function getIdClient(): ?int {
        return $this->idClient;
    }

    /**
     * @return string
     */
    public function getUuid(): string {
        return $this->uuid;
    }

    /**
     * @param string $uuid
     */
    public function setUuid(string $uuid): void {
        $this->uuid = $uuid;
    }

    /**
     * @return mixed
     */
    public function getEmail() {
        return $this->email;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email): void {
        $this->email = $email;
    }

    public function getPrenom(): ?string {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self {
        $this->prenom = $prenom;

        return $this;
    }

    public function getNom(): ?string {
        return $this->nom;
    }

    public function setNom(string $nom): self {
        $this->nom = $nom;

        return $this;
    }

    public function getAdresse(): ?string {
        return $this->adresse;
    }

    public function setAdresse(string $adresse): self {
        $this->adresse = $adresse;

        return $this;
    }

    public function getCp(): ?string {
        return $this->cp;
    }

    public function setCp(string $cp): self {
        $this->cp = $cp;

        return $this;
    }

    public function getVille(): ?string {
        return $this->ville;
    }

    public function setVille(string $ville): self {
        $this->ville = $ville;

        return $this;
    }

    public function getTel(): ?string {
        return $this->tel;
    }

    public function setTel(string $tel): self {
        $this->tel = $tel;

        return $this;
    }

    public function getNewsletter() {
        return $this->newsletter;
    }

    public function setNewsletter($newsletter): self {
        $this->newsletter = $newsletter;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string {
        return (string)$this->password;
    }

    public function setPassword(string $password): self {
        $this->password = $password;

        return $this;
    }

    public function getSalt() {
        return null;
    }

    public function eraseCredentials() {
        // TODO: Implement eraseCredentials() method.
    }

    public function getUsername(): string {
        return (string)$this->email;
    }
}
