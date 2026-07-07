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
}