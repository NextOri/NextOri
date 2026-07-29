<?php

require_once __DIR__ . "/../config/database.php";


class MetiersService
{

    private PDO $connexion;


    public function __construct()
    {
        $database = new Database();

        $this->connexion = $database->connect();
    }



    /**
     * Récupérer tous les métiers du catalogue
     */
    public function getAllMetiers(): array
    {

        $sql = "
            SELECT
                id_metier,
                nom,
                description,
                secteur,
                niveau_etude,
                salaire_min,
                salaire_max,
                tendance
            FROM metier
            ORDER BY nom ASC
        ";


        $requete = $this->connexion->prepare($sql);

        $requete->execute();


        return $requete->fetchAll(PDO::FETCH_ASSOC);

    }


}