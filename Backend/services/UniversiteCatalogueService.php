<?php

require_once __DIR__ . "/../config/database.php";


class UniversiteCatalogueService
{

    private PDO $connexion;


    public function __construct()
    {

        $database = new Database();

        $this->connexion = $database->connect();

    }



    public function getAllUniversites(): array
    {

        $sql = "
            SELECT
                id_universite,
                nom,
                description,
                type,
                pays,
                ville,
                region,
                site_web,
                logo
            FROM universite
            ORDER BY nom ASC
        ";


        $requete = $this->connexion->prepare($sql);

        $requete->execute();


        return $requete->fetchAll(PDO::FETCH_ASSOC);

    }


}