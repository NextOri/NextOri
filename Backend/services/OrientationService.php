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

}