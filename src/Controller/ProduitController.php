<?php

namespace App\Controller;

use App\Entity\Produit;
use App\Repository\DeclinaisonRepository;
use App\Repository\ProduitRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Normalizer\AbstractNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class ProduitController extends AbstractController {

    private ProduitRepository $produitRepository;
    private SerializerInterface $serializer;
    private EntityManagerInterface $entityManager;
    private ValidatorInterface $validator;

    public function __construct(ProduitRepository $produitRepository, SerializerInterface $serializer, EntityManagerInterface $entityManager, ValidatorInterface $validator) {
        $this->produitRepository = $produitRepository;
        $this->serializer = $serializer;
        $this->entityManager = $entityManager;
        $this->validator = $validator;
    }

    /**
     * @Route("/api/products", name="api_produit_getproducts", methods={"GET"})
     */
    public function getProduits(): Response {
        $products = $this->produitRepository->findAll();
        $productsJson = $this->serializer->serialize($products, 'json', ["groups" => "view_product"]);

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/products/category/{id}", name="api_produit_getproductsbyidcategorie", methods={"GET"})
     */
    public function getProduitsByIDCategorie($id): Response {
        $products = $this->produitRepository->findBy(["categorie" => $id]);
        $productsJson = $this->serializer->serialize($products, 'json', ["groups" => "view_product"]);

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/products/{id}", name="api_produit_getproductsbyid", methods={"GET"})
     */
    public function getProduitByID($id): Response {
        $products = $this->produitRepository->find($id);

        $productsJson = $this->serializer->serialize($products, 'json', ["groups" => "view_product"]);

        return new JsonResponse($productsJson, Response::HTTP_OK, [], true);
    }

    private function validateProduit(Produit $produit): ?Response {
        $errors = $this->validator->validate($produit);

        if(sizeof($errors) > 0) {
            $json = $this->serializer->serialize($errors, 'json');
            return new JsonResponse($json, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }

}
