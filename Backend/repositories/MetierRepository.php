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


   /**
 * Retourne les métiers accessibles au test et compatibles
 * avec une série donnée.
 */
public function recupererMetiersParSerie(int $idSerie): array
   {
    $sql = "
        SELECT DISTINCT
            m.id_metier,
            m.nom,
            m.description,
            m.secteur,
            m.niveau_etude,
            m.profil_riasec,
            m.salaire_min,
            m.salaire_max
        FROM metier m
        INNER JOIN metier_serie ms
            ON ms.id_metier = m.id_metier
        WHERE ms.id_serie = :id_serie
          AND m.accessible_test = 1
    ";

    $statement = $this->connection->prepare($sql);

    $statement->execute([
        ':id_serie' => $idSerie
    ]);

    return $statement->fetchAll(PDO::FETCH_ASSOC);
    }


    /**
 * Retourne tous les métiers accessibles au test.
 */
public function recupererMetiersAccessiblesAuTest(): array
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
        WHERE accessible_test = 1
    ";

    $statement = $this->connection->query($sql);

    return $statement->fetchAll(PDO::FETCH_ASSOC);
}
}