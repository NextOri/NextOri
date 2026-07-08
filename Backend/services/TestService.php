<?php

require_once __DIR__ . "/../repositories/TestRepository.php";

class TestService
{
    private TestRepository $testRepository;

    public function __construct()
    {
        $this->testRepository = new TestRepository();
    }

   /**
 * Crée un nouveau test
 */
public function creerTest(
    int $idUser,
    int $idQuestionnaire
): int
{
    return $this->testRepository->creerTest(
        $idUser,
        $idQuestionnaire
    );
}
}