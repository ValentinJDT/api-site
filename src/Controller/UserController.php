<?php

namespace App\Controller;

use App\Entity\Employe;
use App\Repository\EmployeRepository;
use App\Repository\RoleRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class UserController extends AbstractController {

    private SerializerInterface $serializer;
    private EntityManagerInterface $entityManager;
    private EmployeRepository $employeRepository;
    private UserPasswordHasherInterface $userPasswordHasher;
    private RoleRepository $roleRepository;

    public function __construct(SerializerInterface $serializer, UserPasswordHasherInterface $userPasswordHasher, EntityManagerInterface $entityManager, EmployeRepository $employeRepository, RoleRepository $roleRepository) {
        $this->serializer = $serializer;
        $this->userPasswordHasher = $userPasswordHasher;
        $this->entityManager = $entityManager;
        $this->employeRepository = $employeRepository;
        $this->roleRepository = $roleRepository;
    }


    /**
     * @Route("/api/employees", name="api_employe_createemploye", methods={"POST"})
     */
    public function createEmploye(Request $request): Response {

        $content = json_decode($request->getContent(), true);

        try {
            $employe = new Employe();

            $password = $this->userPasswordHasher->hashPassword($employe, base64_decode($content["password"]));
            $employe->setPassword($password);

            $employe->setUuid($this->guidv4());
            $employe->setNom($content["lastname"]);
            $employe->setPrenom($content["firstname"]);
            $employe->setRoles(array());
            $employe->setEmail($content["email"]);
            $employe->setAdresse($content["address"]);
            $employe->setVille($content["city"]);
            $employe->setCp($content["zip_code"]);
            $employe->setDateEmbauche(new \DateTime());

            $role = $this->roleRepository->find($content["idRole"]);

            $employe->setRole($role);

            $this->entityManager->persist($employe);
            $this->entityManager->flush();

            $json = $this->serializer->serialize($employe, "json");

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
     * @Route("/api/employees/{id}", name="api_employe_updateemploye", methods={"PUT"})
     */
    public function updateEmploye($id, Request $request): Response {

        $content = json_decode($request->getContent(), true);

        try {
            $employe = $this->employeRepository->findBy(["uuid" => $id])[0];

            $employe->setNom($content["lastname"]);
            $employe->setPrenom($content["firstname"]);
            $employe->setRoles(array());
            $employe->setEmail($content["email"]);
            $employe->setAdresse($content["address"]);
            $employe->setVille($content["city"]);
            $employe->setCp($content["zip_code"]);
            $employe->setImage($content["image"]);

            $role = $this->roleRepository->find($content["idRole"]);

            $employe->setRole($role);

            $this->entityManager->flush();

            $json = $this->serializer->serialize($employe, "json");

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
     * @Route("/api/employees/{id}", name="api_employe_removeemploye", methods={"DELETE"})
     */
    public function removeEmploye($id): Response {
        try {
            $employe = $this->employeRepository->findBy(["uuid" => $id])[0];

            $this->entityManager->remove($employe);
            $this->entityManager->flush();

        } catch(Exception $e) {
            $json = json_encode([
                "code" => Response::HTTP_BAD_REQUEST,
                "message" => "Malformatted JSON"
            ]);

            return new JsonResponse($json, $json["code"], [], true);
        }

        return new JsonResponse(null, Response::HTTP_OK, []);
    }

    /**
     * @Route("/api/employees/{uuid}/role", name="api_employe_getemployerole", methods={"GET"})
     */
    public function getEmployeRole($uuid): Response {

        $employe = $this->employeRepository->findBy(["uuid" => $uuid]);

        if(!empty($employe)) {
            $roleJson = $this->serializer->serialize($employe[0]->getRole(), "json", ["groups" => "view_role"]);
        } else {
            $roleJson = json_encode(null);
        }

        return new JsonResponse($roleJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/employees/{uuid}", name="api_employe_getemploye", methods={"GET"})
     */
    public function getEmploye($uuid): Response {

        $employe = $this->employeRepository->findBy(["uuid" => $uuid]);

        if(!empty($employe)) {
            $employeJson = $this->serializer->serialize($employe[0], "json", ["groups" => "view_employe"]);
        } else {
            $employeJson = json_encode(null);
        }

        return new JsonResponse($employeJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/employees", name="api_employe_getemployes", methods={"GET"})
     */
    public function getEmployes(): Response {
        $employes = $this->employeRepository->findAll();
        $employesJson = $this->serializer->serialize($employes, "json", ["groups" => "view_employe"]);
        return new JsonResponse($employesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/employees/role/{id}", name="api_employe_getemployesbyrole", methods={"GET"})
     */
    public function getEmployesByRole($id): Response {
        $employes = $this->employeRepository->findBy(["role" => $id]);
        $employesJson = $this->serializer->serialize($employes, "json", ["groups" => "view_employe"]);
        return new JsonResponse($employesJson, Response::HTTP_OK, [], true);
    }

    /**
     * @Route("/api/employees/set-password/{id}", name="api_employe_setemployepassword", methods={"PUT"})
     */
    public function setEmployePassword($id, Request $request): Response {

        $content = json_decode($request->getContent(), true);

        try {
            $employe = $this->employeRepository->findBy(["uuid" => $id])[0];

            $password = $this->userPasswordHasher->hashPassword($employe, base64_decode($content["password"]));
            $employe->setPassword($password);

            $this->entityManager->flush();

            $json = $this->serializer->serialize($employe, "json");

        } catch(Exception $e) {
            $json = json_encode([
                "code" => Response::HTTP_BAD_REQUEST,
                "message" => "Malformatted JSON"
            ]);

            return new JsonResponse($json, $json["code"], [], true);
        }

        return new JsonResponse($json, Response::HTTP_OK, [], true);

    }

    public function guidv4() {
        if(function_exists('com_create_guid') === true)
            return trim(com_create_guid(), '{}');

        $data = openssl_random_pseudo_bytes(16);
        $data[6] = chr(ord($data[6]) & 0x0f | 0x40); // set version to 0100
        $data[8] = chr(ord($data[8]) & 0x3f | 0x80); // set bits 6-7 to 10
        return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
    }

}
