<?php

require_once __DIR__ . '/../config/Database.php';


class TestRepository
{
    private PDO $connection;


    public function __construct()
    {
        $database = new Database();

        $this->connection = $database->connect();
    }



    public function creerTest(
        int $idUser,
        int $idQuestionnaire
    ): int
    {

        $sql = "
            INSERT INTO test_riasec
            (
                id_user,
                id_questionnaire,
                score_R,
                score_I,
                score_A,
                score_S,
                score_E,
                score_C,
                date_test
            )

            VALUES

            (
                :user,
                :questionnaire,
                0,
                0,
                0,
                0,
                0,
                0,
                NOW()
            )
        ";


        $statement = $this->connection->prepare($sql);


        $statement->execute([
            ":user" => $idUser,
            ":questionnaire" => $idQuestionnaire
        ]);


        return (int)$this->connection->lastInsertId();
    }

    /**
 * Récupère la série de l'utilisateur ayant effectué le test.
 */
    
  public function recupererSerieParTest(int $idTest): ?int
  {
    $sql = "
        SELECT u.id_serie
        FROM test_riasec t
        INNER JOIN utilisateur u
            ON u.id_user = t.id_user
        WHERE t.id_test = :id_test
    ";

    $statement = $this->connection->prepare($sql);

    $statement->execute([
        ":id_test" => $idTest
    ]);

    $resultat = $statement->fetch(PDO::FETCH_ASSOC);

    if (!$resultat || $resultat["id_serie"] === null) {
        return null;
    }

    return (int) $resultat["id_serie"];
    }

    /**
 * Retourne le dernier test effectué par un utilisateur.
 */
public function obtenirDernierTestUtilisateur(
    int $idUser
): ?array
{

    $sql = "

        SELECT *

        FROM test_riasec

        WHERE id_user = :user

        ORDER BY date_test DESC

        LIMIT 1

    ";

    $statement = $this->connection->prepare($sql);

    $statement->execute([

        ":user" => $idUser

    ]);

    $test = $statement->fetch(PDO::FETCH_ASSOC);

    return $test ?: null;

}


/**
 * Retourne un test précis par son identifiant.
 */
public function obtenirTestParId(
    int $idTest,
    int $idUser
): ?array
{
    $sql = "
        SELECT
            id_test,
            id_user,
            id_questionnaire,
            date_test,
            score_R,
            score_I,
            score_A,
            score_S,
            score_E,
            score_C,
            profil_dominant
        FROM test_riasec
        WHERE id_test = :id_test
        AND id_user = :id_user
        LIMIT 1
    ";

    $statement = $this->connection->prepare($sql);

    $statement->execute([
        ":id_test" => $idTest,
        ":id_user" => $idUser
    ]);

    $test = $statement->fetch(PDO::FETCH_ASSOC);

    return $test ?: null;
}


/**
 * Récupère tous les tests effectués par un utilisateur.
 */
public function obtenirTousLesTestsUtilisateur(
    int $idUser
): array
{

    $sql = "

        SELECT
            id_test,
            id_user,
            id_questionnaire,
            date_test,
            score_R,
            score_I,
            score_A,
            score_S,
            score_E,
            score_C,
            profil_dominant

        FROM test_riasec

        WHERE id_user = :user

        ORDER BY date_test DESC

    ";

    $statement = $this->connection->prepare($sql);

    $statement->execute([
        ":user" => $idUser
    ]);

    return $statement->fetchAll(PDO::FETCH_ASSOC);
}
}