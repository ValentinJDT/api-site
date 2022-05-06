<?php

namespace App\Controller;

use App\Repository\CommandeDeclinaisonRepository;
use App\Repository\CommandeRepository;
use App\Repository\StatutRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Doctrine\ORM\EntityManagerInterface;

class CommandeController extends AbstractController {

    private CommandeRepository $commandeRepository;
    private CommandeDeclinaisonRepository $commandeDeclinaisonRepository;
    private StatutRepository $statutRepository;
    private SerializerInterface $serializer;
    private EntityManagerInterface $entityManager;

    public function __construct(CommandeRepository $commandeRepository, CommandeDeclinaisonRepository $commandeDeclinaisonRepository, StatutRepository $statutRepository, SerializerInterface $serializer, EntityManagerInterface $entityManager) {
        $this->commandeRepository = $commandeRepository;
        $this->commandeDeclinaisonRepository = $commandeDeclinaisonRepository;
        $this->serializer = $serializer;
        $this->statutRepository = $statutRepository;
        $this->entityManager = $entityManager;
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
        $products = $this->commandeDeclinaisonRepository->findBy([ "idCommande" => $id ]);
        $productsJson = $this->serializer->serialize($products, 'json');

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/statuts/", name="api_order_getstatuts", methods={"GET"})
     */
    public function getStatuts(): Response {
        $statuts = $this->statutRepository->findAll();
        $statutsJson = $this->serializer->serialize($statuts, 'json');

        return new JsonResponse($statutsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/orders/{idCommande}/{idStatut}", name="api_order_setstatut", methods={"POST"})
     */
    public function setOrderStatut($idCommande, $idStatut): Response {
        $order = $this->commandeRepository->find($idCommande);
        $statut = $this->statutRepository->find($idStatut);

        $order->setIdStatut($statut);
        $this->entityManager->flush();

        $orderJson = $this->serializer->serialize($order, 'json');

        return new JsonResponse($orderJson, Response::HTTP_OK, [], true);
    }

}
