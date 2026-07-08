<?php

require_once __DIR__ . "/../config/Database.php";

class MetierRepository
{
    private PDO $connection;

    public function __construct()
    {
        $database = new Database();
        $this->connection = $database->connect();
    }

    /**
     * Retourne tous les métiers.
     */
    public function recupererTousLesMetiers(): array
    {
        $sql = "
            SELECT
                id_metier,
                nom,
                description,
                secteur,
                niveau_etude,
                profil_riasec,
                salaire_min,
                salaire_max
            FROM metier
        ";

        $statement = $this->connection->query($sql);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }
}