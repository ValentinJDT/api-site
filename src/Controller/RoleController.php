<?php

namespace App\Controller;

use App\Repository\RoleRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\SerializerInterface;

class RoleController extends AbstractController {

    private SerializerInterface $serializer;
    private RoleRepository $roleRepository;

     public function __construct(SerializerInterface $serializer, RoleRepository $roleRepository) {
         $this->serializer = $serializer;
         $this->roleRepository = $roleRepository;
     }

    /**
     * @Route("/api/roles", name="api_role_getroles", methods={"GET"})
     */
    public function getRoles(): Response {

        $roles = $this->roleRepository->findAll();
        $rolesJson = $this->serializer->serialize($roles, 'json', ["groups" => "view_role"]);

        return new JsonResponse($rolesJson, Response::HTTP_OK, [], true);
    }
}
