<?php


require_once __DIR__ . "/../config/database.php";

class DashboardService
{
    private PDO $connexion;

    public function __construct()
    {
        $database = new Database();
        $this->connexion = $database->connect();
    }

    public function recupererDashboard(int $idUser): ?array
    {
        $sql = "
            SELECT nom
            FROM utilisateur
            WHERE id_user = ?
        ";

        $requete = $this->connexion->prepare($sql);
        $requete->execute([$idUser]);

        $utilisateur = $requete->fetch(PDO::FETCH_ASSOC);

        if (!$utilisateur) {
            return null;
        }

        return [

            "utilisateur" => [

                "nom" => $utilisateur["nom"]

            ],

            /*
            Ces données resteront fixes
            jusqu'à ce qu'on crée leur logique.
            */

            "niveau" => [

                "nom" => "Explorateur",

                "numero" => 1,

                "progression" => 60

            ],

            "statistiques" => [

                "points" => 120,

                "serie" => 7,

                "badges" => 3

            ]

        ];
    }
}