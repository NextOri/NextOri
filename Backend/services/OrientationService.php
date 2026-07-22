<?php

require_once __DIR__ . "/TestService.php";
require_once __DIR__ . "/ReponseService.php";
require_once __DIR__ . "/RiasecService.php";
require_once __DIR__ . "/TestResultService.php";
require_once __DIR__ . "/MetierService.php";
require_once __DIR__ . "/FiliereService.php";
require_once __DIR__ . "/UniversiteService.php";


class OrientationService
{

    private TestService $testService;
    private ReponseService $reponseService;
    private RiasecService $riasecService;
    private TestResultService $testResultService;
    private MetierService $metierService;
    private FiliereService $filiereService;
    private UniversiteService $universiteService;
    



    public function __construct()
    {

        $this->testService = new TestService();

        $this->reponseService = new ReponseService();

        $this->riasecService = new RiasecService();

        $this->testResultService = new TestResultService();

        $this->metierService = new MetierService();

        $this->filiereService = new FiliereService();

        $this->universiteService = new UniversiteService();

    }




    public function demarrerTest(
        int $idUser,
        int $idQuestionnaire
    ): int
    {

        return $this->testService->creerTest(
            $idUser,
            $idQuestionnaire
        );

    }


    

    public function enregistrerReponses(
        int $idTest,
        array $reponses
    ): void
    {
      
   
        $this->reponseService->enregistrerReponses(
            $idTest,
            $reponses
        );

    }





    public function calculerProfil(
        int $idTest
    ): array
    {

        $scores =
            $this->riasecService->calculerScores($idTest);


        $profil =
            $this->riasecService->determinerProfil($scores);



        return [

            "scores" => $scores,

            "profil" => $profil

        ];

    }





    /**
     * Nouvelle méthode :
     * Ajoute filières et universités à chaque métier
     */
    private function enrichirMetiersAvecFormations(
        array $metiers
    ): array
    {

        $resultat = [];



        foreach ($metiers as $metier) {


            $filieres = 
                $this->filiereService
                     ->rechercherFilieresCompatibles(
                         [$metier]
                     );



            $filieresCompletes = [];



            foreach ($filieres as $filiere) {


                $universites =
                    $this->universiteService
                         ->rechercherUniversitesCompatibles(
                             [$filiere]
                         );



                $filieresCompletes[] = [


                    "filiere" => $filiere,


                    "universites" => $universites


                ];

            }




            $metier["filieres"] =
                $filieresCompletes;



            $resultat[] = $metier;

        }



        return $resultat;

    }



    /**
 * Récupère le dernier test effectué par un utilisateur.
 */
   public function recupererDernierResultat(
    int $idUser
): ?array
{

    // 1. Récupérer le dernier test
    $test = $this->testService
                 ->obtenirDernierTestUtilisateur(
                     $idUser
                 );


    if ($test === null) {

        return null;

    }


    // 2. Récupérer le profil enregistré

    $profilPrincipal = $test["profil_dominant"];



    $scores = [

        "R" => $test["score_R"],
        "I" => $test["score_I"],
        "A" => $test["score_A"],
        "S" => $test["score_S"],
        "E" => $test["score_E"],
        "C" => $test["score_C"]

    ];



    // 3. Rechercher les métiers comme dans executerOrientation

    $metiers =
        $this->metierService
             ->obtenirRecommandations(
                 $profilPrincipal
             );



    // 4. Ajouter formations + universités

    $metiersPrincipaux =
        $this->enrichirMetiersAvecFormations(
            $metiers["principaux"]
        );


    $metiersSecondaires =
        $this->enrichirMetiersAvecFormations(
            $metiers["secondaires"]
        );



    // 5. Retour même structure que executerOrientation

    return [

        "id_test" => $test["id_test"],


        "profil" => [

            "principal" => $profilPrincipal,

            "scores" => $scores

        ],


        "recommandations" => [

            "principaux" => $metiersPrincipaux,

            "secondaires" => $metiersSecondaires

        ]

    ];

}



    /**
     * Processus complet NextOri
     */
    public function executerOrientation(
        int $idUser,
        int $idQuestionnaire,
        array $reponses
    ): array
    {



        // 1 Création test

        $idTest =
            $this->demarrerTest(
                $idUser,
                $idQuestionnaire
            );




        // 2 Enregistrement réponses

        $this->enregistrerReponses(
            $idTest,
            $reponses
        );





        // 3 Calcul profil

        $profil =
            $this->calculerProfil($idTest);

        
            $this->testResultService->mettreAJourResultat(
             $idTest,
             $profil["scores"],
             $profil["profil"]["profil_principal"]
            );




        // Profil principal

        $profilPrincipal =
            $profil["profil"]["profil_principal"];







        // 4 Recherche métiers

        $metiers =
            $this->metierService
                 ->obtenirRecommandations(
                     $profilPrincipal
                 );






        // 5 Ajouter filières + universités

        $metiersPrincipaux = 
            $this->enrichirMetiersAvecFormations(
                $metiers["principaux"]
            );



        $metiersSecondaires = 
            $this->enrichirMetiersAvecFormations(
                $metiers["secondaires"]
            );







        return [


            "id_test" => $idTest,



            "profil" => $profil,



            "recommandations" => [


                "principaux" => $metiersPrincipaux,


                "secondaires" => $metiersSecondaires


            ]


        ];

    }

}