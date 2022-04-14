<?php

namespace App\Controller;

use App\Repository\DeclinaisonRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class DeclinaisonController extends AbstractController {

    private DeclinaisonRepository $declinaisonRepository;
    private SerializerInterface $serializer;

    public function __construct(DeclinaisonRepository $declinaisonRepository, SerializerInterface $serializer) {
        $this->declinaisonRepository = $declinaisonRepository;
        $this->serializer = $serializer;
    }

    /**
     * @Route("/api/declinaisons", name="api_declinaison_getdeclinaisons", methods={"GET"})
     */
    public function getDeclinaisons(): Response {
        $declinaisons = $this->declinaisonRepository->findAll();

        $productsJson = $this->serializer->serialize($declinaisons, 'json', ["groups" => "view_declinaison"]);

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/declinaisons/{id}", name="api_declinaison_getdeclinaisonbyid", methods={"GET"})
     */
    public function getDeclinaisonByID($id): Response {
        $declinaisons = $this->declinaisonRepository->find($id);

        $productsJson = $this->serializer->serialize($declinaisons, 'json', ["groups" => "view_declinaison"]);

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }
}
