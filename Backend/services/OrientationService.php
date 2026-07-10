<?php

require_once __DIR__ . "/TestService.php";
require_once __DIR__ . "/ReponseService.php";
require_once __DIR__ . "/RiasecService.php";
require_once __DIR__ . "/MetierService.php";
require_once __DIR__ . "/FiliereService.php";
require_once __DIR__ . "/UniversiteService.php";

class OrientationService
{

    private TestService $testService;

    private ReponseService $reponseService;

    private RiasecService $riasecService;

    private MetierService $metierService;

    private FiliereService $filiereService;

    private UniversiteService $universiteService;


    public function __construct()
    {

        $this->testService = new TestService();

        $this->reponseService = new ReponseService();

        $this->riasecService = new RiasecService();

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
    $scores = $this->riasecService->calculerScores($idTest);

    $profil = $this->riasecService->determinerProfil($scores);

    return [
        "scores" => $scores,
        "profil" => $profil
    ];
    }
    public function rechercherMetiers(
    string $profil
   ): array
   {
    return $this->metierService->rechercherMetiersCompatibles($profil);
    } 
    public function rechercherFilieres(
    array $metiers
    ): array
    {
    return $this->filiereService
                ->rechercherFilieresCompatibles($metiers);
    }
 public function rechercherUniversites(
    array $filieres
    ): array
   { 
    return $this->universiteService
                ->rechercherUniversitesCompatibles($filieres);
   }
 /**
 * Exécute tout le processus d'orientation.
 */
  public function executerOrientation(
    int $idUser,
    int $idQuestionnaire,
    array $reponses
 ): array
 {

    // 1. Création du test

    $idTest = $this->demarrerTest(
        $idUser,
        $idQuestionnaire
    );


    // 2. Enregistrement des réponses

    $this->enregistrerReponses(
        $idTest,
        $reponses
    );


    // 3. Calcul du profil

    $resultatRiasec = $this->calculerProfil(
        $idTest
    );


    // 4. Profil principal

    $profilPrincipal =
        $resultatRiasec["profil"]["profil_principal"];


    // 5. Métiers

    $metiers =
        $this->rechercherMetiers(
            $profilPrincipal
        );


    // 6. Filières

    $filieres =
        $this->rechercherFilieres(
            $metiers
        );


    // 7. Universités

    $universites =
        $this->rechercherUniversites(
            $filieres
        );


    // 8. Résultat final

    return [

        "id_test" => $idTest,

        "profil" => $resultatRiasec,

        "metiers" => $metiers,

        "filieres" => $filieres,

        "universites" => $universites

    ];

 }

}