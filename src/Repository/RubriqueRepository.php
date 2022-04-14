<?php

namespace App\Repository;

use App\Entity\Article;
use App\Entity\Rubrique;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query\Expr\Join;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Rubrique|null find($id, $lockMode = null, $lockVersion = null)
 * @method Rubrique|null findOneBy(array $criteria, array $orderBy = null)
 * @method Rubrique[]    findAll()
 * @method Rubrique[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class RubriqueRepository extends ServiceEntityRepository {
    public function __construct(ManagerRegistry $registry) {
        parent::__construct($registry, Rubrique::class);
    }

    /**
     * @return Rubrique[]
     */
    public function findAllWhoHasArticles(): array {
        return $this->createQueryBuilder('r')
            ->distinct()
            ->select('r.idRubrique, r.titre, r.description, COUNT(a.idRubrique) as numArticles')
            ->innerJoin(Article::class, 'a', Join::WITH, "r.idRubrique = a.idRubrique")
            ->groupBy('r.idRubrique, r.titre, r.description')
            ->having('COUNT(a.idRubrique) > 0')
            ->getQuery()->getArrayResult();
    }

    // /**
    //  * @return Rubrique[] Returns an array of Rubrique objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('r.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Rubrique
    {
        return $this->createQueryBuilder('r')
            ->andWhere('r.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
