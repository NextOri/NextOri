<?php

require_once __DIR__ . "/../config/Database.php";


class FiliereRepository
{

    private PDO $connection;


    public function __construct()
    {
        $database = new Database();

        $this->connection = $database->connect();
    }



    /**
     * Récupérer les filières liées à un métier
     */
    public function recupererFilieresParMetier(int $idMetier): array
    {

        $sql = "
            SELECT 
                f.id_filiere,
                f.nom,
                f.description,
                f.domaine,
                f.duree

            FROM filiere f

            INNER JOIN metier_filiere mf
            ON f.id_filiere = mf.id_filiere

            WHERE mf.id_metier = :id_metier
        ";


        $statement = $this->connection->prepare($sql);


        $statement->execute([
            "id_metier" => $idMetier
        ]);


        return $statement->fetchAll(PDO::FETCH_ASSOC);

    }


}