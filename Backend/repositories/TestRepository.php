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
}