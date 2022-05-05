<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CommandeDeclinaison
 *
 * @ORM\Table(name="commande_declinaison", indexes={@ORM\Index(name="FK_221", columns={"id_produit_declinaison"}), @ORM\Index(name="FK_242", columns={"id_commande"})})
 * @ORM\Entity(repositoryClass="App\Repository\CommandeDeclinaisonRepository")
 */
class CommandeDeclinaison
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_commande_declinaison", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idCommandeDeclinaison;

    /**
     * @var int
     *
     * @ORM\Column(name="quantite", type="integer", nullable=false)
     */
    private $quantite;

    /**
     * @var int
     *
     * @ORM\Column(name="prix_ht", type="integer", nullable=false)
     */
    private $prixHt;

    /**
     * @var \ProduitDeclinaison
     *
     * @ORM\ManyToOne(targetEntity="ProduitDeclinaison")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_produit_declinaison", referencedColumnName="id_produit_declinaison")
     * })
     */
    private $idProduitDeclinaison;

    /**
     * @var \Commande
     *
     * @ORM\ManyToOne(targetEntity="Commande")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="id_commande", referencedColumnName="id_commande")
     * })
     */
    private $idCommande;

    public function getIdCommandeDeclinaison(): ?int
    {
        return $this->idCommandeDeclinaison;
    }

    public function getQuantite(): ?int
    {
        return $this->quantite;
    }

    public function setQuantite(int $quantite): self
    {
        $this->quantite = $quantite;

        return $this;
    }

    public function getPrixHt(): ?int
    {
        return $this->prixHt;
    }

    public function setPrixHt(int $prixHt): self
    {
        $this->prixHt = $prixHt;

        return $this;
    }

    public function getIdProduitDeclinaison(): ?ProduitDeclinaison
    {
        return $this->idProduitDeclinaison;
    }

    public function setIdProduitDeclinaison(?ProduitDeclinaison $idProduitDeclinaison): self
    {
        $this->idProduitDeclinaison = $idProduitDeclinaison;

        return $this;
    }

    public function getIdCommande(): ?Commande
    {
        return $this->idCommande;
    }

    public function setIdCommande(?Commande $idCommande): self
    {
        $this->idCommande = $idCommande;

        return $this;
    }


}
