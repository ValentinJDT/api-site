<?php

namespace App\Controller;

use App\Entity\ProduitDeclinaison;
use App\Repository\DeclinaisonRepository;
use App\Repository\ProduitDeclinaisonRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class DeclinaisonController extends AbstractController {

    private ProduitDeclinaisonRepository $produitDeclinaisonRepository;
    private SerializerInterface $serializer;

    public function __construct(DeclinaisonRepository $declinaisonRepository, ProduitDeclinaisonRepository $produitDeclinaisonRepository, SerializerInterface $serializer) {
        $this->declinaisonRepository = $declinaisonRepository;
        $this->produitDeclinaisonRepository = $produitDeclinaisonRepository;
        $this->serializer = $serializer;
    }

    /**
     * @Route("/api/declinaisons", name="api_declinaison_getdeclinaisons", methods={"GET"})
     */
    public function getDeclinaisons(): Response {
        $declinaisons = $this->declinaisonRepository->findAll();

        $productsJson = $this->serializer->serialize($declinaisons, 'json');

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/declinaisons/{id}", name="api_declinaison_getdeclinaisonbyid", methods={"GET"})
     */
    public function getDeclinaisonByID($id): Response {
        $declinaisons = $this->declinaisonRepository->find($id);

        $productsJson = $this->serializer->serialize($declinaisons, 'json');

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/declinaisons/product/{id}", name="api_declinaison_getdeclinaisonbyidproduit", methods={"GET"})
     */
    public function getDeclinaisonByIdProduit($id): Response {
        $declinaisons = $this->produitDeclinaisonRepository->findBy(["idProduit" => ["idProduit" => $id]]);

        $productsJson = $this->serializer->serialize($declinaisons, 'json');

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }
}
