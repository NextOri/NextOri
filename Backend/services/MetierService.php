<?php

require_once __DIR__ . "/../repositories/MetierRepository.php";


class MetierService
{
    private MetierRepository $metierRepository;


    public function __construct()
    {
        $this->metierRepository = new MetierRepository();
    }



    /**
     * Recherche les métiers compatibles avec un profil RIASEC utilisateur
     */
    public function rechercherMetiersCompatibles(string $profil): array
    {

        $metiers = $this->metierRepository->recupererTousLesMetiers();


        foreach ($metiers as &$metier) {


            $profilMetier = $metier["profil_riasec"];


            // Calcul du score de compatibilité

            $metier["score_compatibilite"] =
                $this->calculerCompatibilite(
                    $profil,
                    $profilMetier
                );


            // Nombre de lettres communes

            $metier["nombre_correspondances"] =
                $this->compterCorrespondances(
                    $profil,
                    $profilMetier
                );

        }


        unset($metier);



        /**
         * Tri :
         * 1 - Score de compatibilité décroissant
         * 2 - Nombre de correspondances décroissant
         */

        usort($metiers, function($a, $b) {


            if ($a["score_compatibilite"] != $b["score_compatibilite"]) {

                return $b["score_compatibilite"]
                    <=>
                    $a["score_compatibilite"];

            }


            return $b["nombre_correspondances"]
                <=>
                $a["nombre_correspondances"];

        });



        return $metiers;

    }






    /**
     * Algorithme de compatibilité NextOri V1
     *
     * Première lettre du profil :
     * Position 1 = 4 points
     * Position 2 = 2 points
     * Position 3 = 1 point
     *
     * Deuxième lettre du profil :
     * Position 2 = 4 points
     * Position 1 = 2 points
     * Position 3 = 1 point
     */

    private function calculerCompatibilite(
        string $profilUtilisateur,
        string $profilMetier
    ): int
    {


        $score = 0;


        $premiereLettre = $profilUtilisateur[0];

        $deuxiemeLettre = $profilUtilisateur[1];



        // Traitement de la première lettre

        $position = strpos(
            $profilMetier,
            $premiereLettre
        );


        if ($position === 0) {

            $score += 4;

        } elseif ($position === 1) {

            $score += 2;

        } elseif ($position === 2) {

            $score += 1;

        }




        // Traitement de la deuxième lettre

        $position = strpos(
            $profilMetier,
            $deuxiemeLettre
        );


        if ($position === 1) {

            $score += 4;

        } elseif ($position === 0) {

            $score += 2;

        } elseif ($position === 2) {

            $score += 1;

        }



        return $score;

    }







    /**
     * Compte le nombre de lettres du profil
     * présentes dans le profil métier
     */

    private function compterCorrespondances(
        string $profilUtilisateur,
        string $profilMetier
    ): int
    {


        $nombre = 0;



        if (strpos($profilMetier, $profilUtilisateur[0]) !== false) {

            $nombre++;

        }



        if (strpos($profilMetier, $profilUtilisateur[1]) !== false) {

            $nombre++;

        }



        return $nombre;

    }
    /**
 * Retourne les métiers principaux et secondaires
 */
public function obtenirRecommandations(string $profil): array
{

    $metiers = $this->rechercherMetiersCompatibles($profil);


    return [

        "principaux" => array_slice($metiers, 0, 5),

        "secondaires" => array_slice($metiers, 5, 5)

    ];

}
/**
 * Prépare les données finales pour le frontend
 */
public function formaterRecommandations(string $profil): array
{

    $recommandations = $this->obtenirRecommandations($profil);


    return [

        "profil" => $profil,

        "metiers_principaux" =>
            $this->formaterMetiers(
                $recommandations["principaux"]
            ),


        "metiers_secondaires" =>
            $this->formaterMetiers(
                $recommandations["secondaires"]
            )

    ];

}




/**
 * Nettoie les informations envoyées au frontend
 */
private function formaterMetiers(array $metiers): array
{

    $resultat = [];


    foreach ($metiers as $metier) {


        $resultat[] = [

            "id" => $metier["id_metier"],

            "nom" => $metier["nom"],

            "profil_riasec" =>
                $metier["profil_riasec"],

            "score" =>
                $metier["score_compatibilite"]

        ];

    }


    return $resultat;

}


}