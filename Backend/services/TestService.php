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


/**
 * Retourne le dernier test effectué par un utilisateur.
 */
public function obtenirDernierTestUtilisateur(
    int $idUser
): ?array
{

    return $this->testRepository
                ->obtenirDernierTestUtilisateur(
                    $idUser
                );

}

/**
 * Retourne tous les tests effectués par un utilisateur.
 */
public function obtenirTousLesTestsUtilisateur(
    int $idUser
): array
{
    return $this->testRepository
                ->obtenirTousLesTestsUtilisateur(
                    $idUser
                );
}
}