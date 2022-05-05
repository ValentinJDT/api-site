<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ProduitDeclinaison
 *
 * @ORM\Table(name="produit_declinaison", indexes={@ORM\Index(name="FK_234", columns={"id_produit"}), @ORM\Index(name="FK_237", columns={"id_declinaison"})})
 * @ORM\Entity(repositoryClass="App\Repository\ProduitDeclinaisonRepository")
 */
class ProduitDeclinaison
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_produit_declinaison", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idProduitDeclinaison;

    /**
     * @var \Produit
     *
     * @ORM\ManyToOne(targetEntity="Produit")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_produit", referencedColumnName="id_produit")
     * })
     */
    private $idProduit;

    /**
     * @var \Declinaison
     *
     * @ORM\ManyToOne(targetEntity="Declinaison")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_declinaison", referencedColumnName="id_declinaison")
     * })
     */
    private $idDeclinaison;

    public function getIdProduitDeclinaison(): ?int
    {
        return $this->idProduitDeclinaison;
    }

    public function getIdProduit(): ?Produit
    {
        return $this->idProduit;
    }

    public function setIdProduit(?Produit $idProduit): self
    {
        $this->idProduit = $idProduit;

        return $this;
    }

    public function getIdDeclinaison(): ?Declinaison
    {
        return $this->idDeclinaison;
    }

    public function setIdDeclinaison(?Declinaison $idDeclinaison): self
    {
        $this->idDeclinaison = $idDeclinaison;

        return $this;
    }


}
