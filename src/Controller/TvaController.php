<?php

namespace App\Controller;

use App\Repository\TvaRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class TvaController extends AbstractController {

    private TvaRepository $tvaRepository;
    private SerializerInterface $serializer;

    public function __construct(TvaRepository $tvaRepository, SerializerInterface $serializer) {
        $this->tvaRepository = $tvaRepository;
        $this->serializer = $serializer;
    }

    /**
     * @Route("/api/tvas", name="api_tva_gettvas", methods={"GET"})
     */
    public function getTvas(): Response {
        $tvas = $this->tvaRepository->findAll();
        $tvasJson = $this->serializer->serialize($tvas, 'json', ["groups" => "view_tva"]);

        return new JsonResponse($tvasJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/tvas/{id}", name="api_tva_gettvabyid", methods={"GET"})
     */
    public function getTvaByID($id): Response {
        $tva = $this->tvaRepository->find($id);
        $tvaJson = $this->serializer->serialize($tva, 'json', ["groups" => "view_tva"]);

        return new JsonResponse($tvaJson, Response::HTTP_OK, [], true);
    }
}
