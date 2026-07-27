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

     private function calculerPoints(int $idUser): int
   {
    $points = 0;

    // 1. Profil créé (+20)
    $sql = "SELECT COUNT(*) FROM utilisateur WHERE id_user = ?";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $points += 20;
    }

    // 2. Test RIASEC terminé (+50)
    $sql = "SELECT COUNT(*) FROM test_riasec WHERE id_user = ?";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $points += 50;
    }

    // Les autres actions seront ajoutées plus tard
    // +20 Consultation résultats
    // +10 Consultation profil
    // +10 Consultation formation
    // +10 Consultation université

    return $points;
   }

   private function calculerNiveau(int $points): array
   {
    if ($points < 100) {

        return [

            "nom" => "Explorateur",
            "numero" => 1,
            "progression" => $points

        ];

    }

    elseif ($points < 250) {

        return [

            "nom" => "Découvreur",
            "numero" => 2,
            "progression" => intval((($points - 100) / 150) * 100)

        ];

    }

    elseif ($points < 500) {

        return [

            "nom" => "Visionnaire",
            "numero" => 3,
            "progression" => intval((($points - 250) / 250) * 100)

        ];

    }

    return [

        "nom" => "Expert",
        "numero" => 4,
        "progression" => 100

    ];
    }

    private function calculerSerie(int $idUser): int
    {
    /*
     * V1 :
     * La série sera calculée automatiquement
     * lorsque l'historique de connexion sera disponible.
     */

    return 1;
    }
         private function calculerBadges(int $idUser): int
    {
    /*
     * V1 :
     * Les badges seront ajoutés plus tard.
     */

    return 0;
    }

    private function calculerParcours(int $idUser): array
{

    // =========================
    // 1. PROFIL CRÉÉ
    // =========================

    $profil = false;

    $sql = "SELECT COUNT(*) FROM utilisateur WHERE id_user = ?";

    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {

        $profil = true;

    }


    // =========================
    // 2. TEST RIASEC TERMINÉ
    // =========================

    $test = false;

    $sql = "SELECT COUNT(*) FROM test_riasec WHERE id_user = ?";

    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {

        $test = true;

    }


    // =========================
    // 3. HISTORIQUE
    // =========================

    $actions = [];


    $sql = "
        SELECT action 
        FROM historique 
        WHERE id_user = ?
    ";


    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);


    while ($ligne = $requete->fetch(PDO::FETCH_ASSOC)) {

        $actions[] = $ligne['action'];

    }



    return [

        "profil" => $profil,

        "test" => $test,

        "profilConsulte" => in_array(
            "PROFIL_CONSULTE",
            $actions
        ),


        "metiersConsultes" => in_array(
            "METIERS_CONSULTES",
            $actions
        ),


        "formationConsulte" => in_array(
            "FORMATION_CONSULTEE",
            $actions
        ),


        "universiteConsulte" => in_array(
            "UNIVERSITES_CONSULTEES",
            $actions
        )

    ];

}
   /*$profilConsulte = false;

    $metiers = false;

    $formations = false;

    $universites = false;*/

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
        $points = $this->calculerPoints($idUser);
        $niveau = $this->calculerNiveau($points);
        $serie = $this->calculerSerie($idUser);
        $badges = $this->calculerBadges($idUser);
        $parcours = $this->calculerParcours($idUser);

        return [

            "utilisateur" => [

                "nom" => $utilisateur["nom"]

            ],

            /*
            Ces données resteront fixes
            jusqu'à ce qu'on crée leur logique.
            */

            "niveau" => $niveau,

            "statistiques" => [

                "points" => $points,

                "serie" => $serie,

                "badges" => $badges

            ],
            "parcours" => $parcours

        ];
    }
}