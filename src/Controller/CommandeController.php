<?php

namespace App\Controller;

use App\Repository\CommandeDeclinaisonRepository;
use App\Repository\CommandeRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class CommandeController extends AbstractController {

    private CommandeRepository $commandeRepository;
    private CommandeDeclinaisonRepository $commandeDeclinaisonRepository;
    private SerializerInterface $serializer;

    public function __construct(CommandeRepository $commandeRepository, CommandeDeclinaisonRepository $commandeDeclinaisonRepository, SerializerInterface $serializer) {
        $this->commandeRepository = $commandeRepository;
        $this->commandeDeclinaisonRepository = $commandeDeclinaisonRepository;
        $this->serializer = $serializer;
    }

    /**
     * @Route("/api/orders", name="api_order_getorders", methods={"GET"})
     */
    public function getOrders(): Response {
        $orders = $this->commandeRepository->findAll();
        $ordersJson = $this->serializer->serialize($orders, 'json');

        return new JsonResponse($ordersJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/orders/{id}", name="api_order_getorderproducts", methods={"GET"})
     */
    public function getOrderProducts($id): Response {
        $products = $this->commandeDeclinaisonRepository->findBy([ "idCommande" => $id]);
        $ordersJson = $this->serializer->serialize($products, 'json');

        return new JsonResponse($ordersJson, Response::HTTP_OK, [], true);
    }

}
