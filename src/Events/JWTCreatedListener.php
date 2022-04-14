<?php

namespace App\Events;

use App\Entity\Client;
use App\Entity\Employe;
use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;

class JWTCreatedListener {

    // On va s'abonner à l'évenement concernant la création du token
    // A chaque création d'un token, la methode va s'exécuter

    /**
     * @param JWTCreatedEvent $event
     * @return void
     */
    public function onJWTCreated(JWTCreatedEvent $event) {
        // Personnaliser mon payload

        $user = $event->getUser();

        // Enrichissement du payload
        $payload = $event->getData();

        if($user instanceof Client) {
            $payload["phone"] = $user->getTel();
            $payload["power"] = 0;
        } else if($user instanceof Employe) {
            $payload["power"] = $user->getRole()->getPower();
        }

        $payload["uuid"] = $user->getUuid();
        $payload["firstname"] = $user->getPrenom();
        $payload["lastname"] = $user->getNom();
        $payload["address"] = $user->getAdresse();
        $payload["city"] = $user->getVille();
        $payload["zip_code"] = $user->getCp();

        $event->setData($payload);
    }

}
