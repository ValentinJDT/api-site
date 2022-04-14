<?php

namespace App\Controller;

use App\Entity\Categorie;
use App\Repository\CategorieRepository;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Util\Json;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Exception\NotEncodableValueException;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class CategorieController extends AbstractController {

    private CategorieRepository $categorieRepository;
    private SerializerInterface $serializer;
    private EntityManagerInterface $entityManager;
    private ValidatorInterface $validator;

    public function __construct(CategorieRepository $categorieRepository, SerializerInterface $serializer, EntityManagerInterface $entityManager, ValidatorInterface $validator) {
        $this->categorieRepository = $categorieRepository;
        $this->serializer = $serializer;
        $this->entityManager = $entityManager;
        $this->validator = $validator;
    }

    /**
     * @Route("/api/categories", name="api_categorie_getcategories", methods={"GET"})
     */
    public function getCategories(Request $request): Response {

        if($request->query->getBoolean("ignore_no_content")) {
            $categories = $this->categorieRepository->findAllWhoHasProducts();
        } else {
            $categories = $this->categorieRepository->findAll();
        }

        $categoriesJson = $this->serializer->serialize($categories, 'json');

        return new JsonResponse($categoriesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/categories/{id}", name="api_categorie_getcategoriebyid", methods={"GET"})
     */
    public function getCategorieByID($id): Response {
        $categorie = $this->categorieRepository->find($id);
        $categorieJson = $this->serializer->serialize($categorie, 'json');

        return new JsonResponse($categorieJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/categories", name="api_categorie_createcategorie", methods={"POST"})
     */
    public function createCategorie(Request $request): Response {
        $content = $request->getContent();

        try {
            $categorie = $this->serializer->deserialize($content, Categorie::class, 'json', []);

            $validate = $this->validateCategorie($categorie);
            if(!is_null($validate))
                return $validate;

            $this->entityManager->persist($categorie);
            $this->entityManager->flush();

            $categorieJson = $this->serializer->serialize($categorie, 'json');

            return new JsonResponse($categorieJson, Response::HTTP_CREATED, [], true);
        } catch(NotEncodableValueException $exception) {
            // Interception d'une éventuelle exception
            $error = [
                "status" => Response::HTTP_BAD_REQUEST,
                "message" => "Erreur de syntaxe dans le JSON"
            ];

            return new JsonResponse(json_encode($error), $error["status"], [], true);
        }
    }

    /**
     * @Route("/api/categories/{id}", name="api_categorie_deletecategorie", methods={"DELETE"})
     */
    public function deleteCategorie($id) {
        $categorie = $this->categorieRepository->find($id);

        $this->entityManager->remove($categorie);
        $this->entityManager->flush();

        return new JsonResponse(null, Response::HTTP_NO_CONTENT);
    }

    /**
     * @Route("/api/categories/{id}", name="api_categorie_updatecategorie", methods={"PUT"})
     */
    public function updateCategorie(Request $request, $id): Response {
        $categorieJSON = $request->getContent();
        $categorie = $this->categorieRepository->find($id);

        $this->serializer->deserialize($categorieJSON, Categorie::class, 'json', [
            "object_to_populate" => $categorie
        ]);

        $validate = $this->validateCategorie($categorie);
        if(!is_null($validate))
            return $validate;

        $this->entityManager->flush();

        return new JsonResponse(null, Response::HTTP_NO_CONTENT);
    }

    private function validateCategorie(Categorie $categorie): ?Response {
        $errors = $this->validator->validate($categorie);

        if(sizeof($errors) > 0) {
            $json = $this->serializer->serialize($errors, 'json');
            return new JsonResponse($json, Response::HTTP_BAD_REQUEST, [], true);
        }
        return null;
    }
}
