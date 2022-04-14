<?php

namespace App\Controller;

use App\Entity\Article;
use App\Entity\Rubrique;
use App\Repository\ArticleRepository;
use App\Repository\RubriqueRepository;
use Doctrine\ORM\EntityManagerInterface;
use PHPUnit\Exception;
use PHPUnit\Util\Json;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;
use Symfony\Component\Validator\Constraints\DateTime;

class RedacController extends AbstractController {

    private EntityManagerInterface $entityManager;
    private SerializerInterface $serializer;
    private RubriqueRepository $rubriqueRepository;
    private ArticleRepository $articleRepository;

    public function __construct(EntityManagerInterface $entityManager, SerializerInterface $serializer, RubriqueRepository $rubriqueRepository, ArticleRepository $articleRepository) {
        $this->entityManager = $entityManager;
        $this->serializer = $serializer;
        $this->rubriqueRepository = $rubriqueRepository;
        $this->articleRepository = $articleRepository;
    }

    /**
     * @Route("/api/rubrics", name="api_rubrique_getrubriques", methods={"GET"})
     */
    public function getRubriques(Request $request): Response {

        if($request->query->getBoolean("ignore_no_content")) {
            $rubriques = $this->rubriqueRepository->findAllWhoHasArticles();
        } else {
            $rubriques = $this->rubriqueRepository->findAll();
        }

        $json = $this->serializer->serialize($rubriques, "json");

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/rubrics/{id}", name="api_rubrique_getrubrique", methods={"GET"})
     */
    public function getRubrique($id): Response {

        $rubriques = $this->rubriqueRepository->find($id);

        $json = $this->serializer->serialize($rubriques, "json");

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/rubrics", name="api_rubrique_createrubrique", methods={"POST"})
     */
    public function createRubrique(Request $request): Response {

        $content = json_decode($request->getContent(), true);

        try {
            $rubrique = new Rubrique();

            $rubrique->setTitre($content["title"]);
            $rubrique->setDescription($content["description"]);

            $this->entityManager->persist($rubrique);
            $this->entityManager->flush();

            $json = $this->serializer->serialize($rubrique, "json");

        } catch(Exception $e) {
            $json = json_encode([
                "code" => Response::HTTP_BAD_REQUEST,
                "message" => "Malformatted JSON"
            ]);

            return new JsonResponse($json, $json["code"], [], true);
        }

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/rubrics/{id}", name="api_rubrique_updaterubrique", methods={"PUT"})
     */
    public function updateRubrique($id, Request $request): Response {
        $content = json_decode($request->getContent(), true);

        try {
            $rubrique = $this->rubriqueRepository->find($id);

            $rubrique->setTitre($content["title"]);
            $rubrique->setDescription($content["description"]);

            $this->entityManager->flush();

            $json = $this->serializer->serialize($rubrique, "json");

        } catch(Exception $e) {
            $json = json_encode([
                "code" => Response::HTTP_BAD_REQUEST,
                "message" => "Malformed JSON"
            ]);

            return new JsonResponse($json, $json["code"], [], true);
        }

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/rubrics/{id}", name="api_rubrique_removerubrique", methods={"DELETE"})
     */
    public function removeRubrique($id): Response {

        $rubriques = $this->rubriqueRepository->find($id);

        $this->entityManager->remove($rubriques);
        $this->entityManager->flush();

        return new JsonResponse(null, Response::HTTP_OK, []);
    }

    /**
     * @Route("/api/articles", name="api_articles_getarticles", methods={"GET"})
     */
    public function getArticles(): Response {

        $articles = $this->articleRepository->findAll();

        $json = $this->serializer->serialize($articles, "json");

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/articles/{id}", name="api_articles_getarticle", methods={"GET"})
     */
    public function getArticle($id): Response {
        $articles = $this->articleRepository->find($id);

        $json = $this->serializer->serialize($articles, "json");

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/articles", name="api_article_createarticle", methods={"POST"})
     */
    public function createArticle(Request $request): Response {
        $content = json_decode($request->getContent(), true);

        try {

            $article = new Article();

            $article->setIdEmploye($this->getUser());

            $date = new \DateTime();
            $article->setDateCreation($date);

            $rubrique = $this->rubriqueRepository->find($content["idRubrique"]);

            $article->setIdRubrique($rubrique);

            $article->setTitre($content["title"]);
            $article->setContenu($content["content"]);

            $this->entityManager->persist($article);
            $this->entityManager->flush();

            $json = $this->serializer->serialize($article, "json");

        } catch(Exception $e) {
            $json = json_encode([
                "code" => Response::HTTP_BAD_REQUEST,
                "message" => "Malformed JSON"
            ]);

            return new JsonResponse($json, $json["code"], [], true);
        }

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/articles/{id}", name="api_articles_updatearticle", methods={"PUT"})
     */
    public function updateArticle($id, Request $request): Response {

        $content = json_decode($request->getContent(), true);

        try {
            $article = $this->articleRepository->find($id);

            $article->setTitre($content["title"]);
            $article->setContenu($content["content"]);

            $rubrique = $this->rubriqueRepository->find($content["idRubrique"]);

            $article->setIdRubrique($rubrique);

            $this->entityManager->flush();

            $json = $this->serializer->serialize($article, "json");

        } catch(Exception $e) {
            $json = json_encode([
                "code" => Response::HTTP_BAD_REQUEST,
                "message" => "Malformed JSON"
            ]);

            return new JsonResponse($json, $json["code"], [], true);
        }

        return new JsonResponse($json, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/articles/{id}", name="api_articles_removearticle", methods={"DELETE"})
     */
    public function removeArticle($id): Response {
        $articles = $this->articleRepository->find($id);

        $this->entityManager->remove($articles);
        $this->entityManager->flush();

        return new JsonResponse(null, Response::HTTP_OK, []);
    }
}
