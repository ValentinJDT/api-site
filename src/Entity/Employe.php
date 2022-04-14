<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Serializer\Annotation\Groups;

/**
 * Employe
 *
 * @ORM\Table(name="employe", indexes={@ORM\Index(name="fkIdx_113", columns={"id_role"})})
 * @ORM\Entity(repositoryClass="App\Repository\EmployeRepository")
 */
class Employe implements UserInterface, PasswordAuthenticatedUserInterface {
    /**
     * @var int
     *
     * @ORM\Column(name="id_employe", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     * @Groups("view_employe")
     */
    private $idEmploye;

    /**
     * @var string
     *
     * @ORM\Column(name="uuid", type="text", length=36, nullable=false)
     * @Groups("view_employe")
     */
    private $uuid;

    /**
     * @var string
     *
     * @ORM\Column(name="nom", type="text", length=65535, nullable=false)
     * @Groups("view_employe")
     */
    private $nom;

    /**
     * @var string
     *
     * @ORM\Column(name="prenom", type="text", length=65535, nullable=false)
     * @Groups("view_employe")
     */
    private $prenom;

    /**
     * @var string The hashed password
     * @ORM\Column(name="mot_de_passe", type="text", length=65535, nullable=false)
     */
    private $password;

    /**
     * @ORM\Column(name="roles_jwt", type="json")
     * @Groups("view_employe")
     */
    private $roles = [];

    /**
     * @ORM\Column(name="mail", type="text", length=65535, nullable=false, unique=true)
     * @Groups("view_employe")
     */
    private $email;

    /**
     * @var string
     *
     * @ORM\Column(name="adresse", type="text", length=65535, nullable=false)
     * @Groups("view_employe")
     */
    private $adresse;

    /**
     * @var string
     *
     * @ORM\Column(name="ville", type="text", length=65535, nullable=false)
     * @Groups("view_employe")
     */
    private $ville;

    /**
     * @var string
     *
     * @ORM\Column(name="cp", type="text", length=65535, nullable=false)
     * @Groups("view_employe")
     */
    private $cp;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date_embauche", type="date", nullable=false)
     * @Groups("view_employe")
     */
    private $dateEmbauche;

    /**
     * @var \Role
     *
     * @ORM\ManyToOne(targetEntity="Role")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_role", referencedColumnName="id_role")
     * })
     * @Groups("view_employe")
     */
    private $role;

    /**
     * @var string
     * @ORM\Column(name="image", type="text")
     * @Groups("view_employe")
     */
    private $image;

    public function getIdEmploye(): ?int {
        return $this->idEmploye;
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


    public function getNom(): ?string {
        return $this->nom;
    }

    public function setNom(string $nom): self {
        $this->nom = $nom;

        return $this;
    }

    public function getPrenom(): ?string {
        return $this->prenom;
    }

    public function setPrenom(string $prenom): self {
        $this->prenom = $prenom;

        return $this;
    }

    public function getAdresse(): ?string {
        return $this->adresse;
    }

    public function setAdresse(string $adresse): self {
        $this->adresse = $adresse;

        return $this;
    }

    public function getVille(): ?string {
        return $this->ville;
    }

    public function setVille(string $ville): self {
        $this->ville = $ville;

        return $this;
    }

    public function getCp(): ?string {
        return $this->cp;
    }

    public function setCp(string $cp): self {
        $this->cp = $cp;

        return $this;
    }

    public function getDateEmbauche(): ?\DateTimeInterface {
        return $this->dateEmbauche;
    }

    public function setDateEmbauche(\DateTimeInterface $dateEmbauche): self {
        $this->dateEmbauche = $dateEmbauche;

        return $this;
    }

    public function getRole(): ?Role {
        return $this->role;
    }

    public function setRole(?Role $role): self {
        $this->role = $role;

        return $this;
    }


    /**
     * @see UserInterface
     */
    public function getRoles(): array {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_EMPLOYEE
        $roles[] = 'ROLE_EMPLOYEE';

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

    public function getImage(): ?string {
        return $this->image;
    }

    public function setImage(string $image): self {
        $this->image = $image;

        return $this;
    }
}
