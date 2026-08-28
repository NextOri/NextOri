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

    // 3. Profil consulté (+20)
$sql = "SELECT COUNT(*) FROM historique WHERE id_user = ? AND action = 'PROFIL_CONSULTE'";
$requete = $this->connexion->prepare($sql);
$requete->execute([$idUser]);

if ($requete->fetchColumn() > 0) {
    $points += 20;
}

// 4. Métiers consultés (+20)
$sql = "SELECT COUNT(*) FROM historique WHERE id_user = ? AND action = 'METIERS_CONSULTES'";
$requete = $this->connexion->prepare($sql);
$requete->execute([$idUser]);

if ($requete->fetchColumn() > 0) {
    $points += 20;
}

// 5. Formation consultée (+10)
$sql = "SELECT COUNT(*) FROM historique WHERE id_user = ? AND action = 'FORMATION_CONSULTEE'";
$requete = $this->connexion->prepare($sql);
$requete->execute([$idUser]);

if ($requete->fetchColumn() > 0) {
    $points += 10;
}

// 6. Université consultée (+10)
$sql = "SELECT COUNT(*) FROM historique WHERE id_user = ? AND action = 'UNIVERSITES_CONSULTEES'";
$requete = $this->connexion->prepare($sql);
$requete->execute([$idUser]);

if ($requete->fetchColumn() > 0) {
    $points += 10;
}

    return $points;
   }
 

   private function calculerBadges(int $idUser): array
{
    $badges = [];

    // 1. Premier Pas
    $sql = "SELECT COUNT(*) FROM utilisateur WHERE id_user = ?";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $badges[] = [
            "nom" => "Premier Pas",
            "icone" => "premier-pas"
        ];
    }

    // 2. Explorateur
    $sql = "SELECT COUNT(*) FROM test_riasec WHERE id_user = ?";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $badges[] = [
            "nom" => "Explorateur",
            "icone" => "explorateur"
        ];
    }

    // 3. Connaissance de soi
    $sql = "SELECT COUNT(*) FROM historique
            WHERE id_user = ?
            AND action = 'PROFIL_CONSULTE'";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $badges[] = [
            "nom" => "Connaissance de soi",
            "icone" => "connaissance-de-soi"
        ];
    }

    // 4. Découvreur de métiers
    $sql = "SELECT COUNT(*) FROM historique
            WHERE id_user = ?
            AND action = 'METIERS_CONSULTES'";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $badges[] = [
            "nom" => "Découvreur de métiers",
            "icone" => "decouvreur-metiers"
        ];
    }

    // 5. Choix de carrière
    $sql = "SELECT COUNT(*) FROM historique
            WHERE id_user = ?
            AND action = 'FORMATION_CONSULTEE'";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $badges[] = [
            "nom" => "Choix de carrière",
            "icone" => "choix-carriere"
        ];
    }

    // 6. Prêt pour l'université
    $sql = "SELECT COUNT(*) FROM historique
            WHERE id_user = ?
            AND action = 'UNIVERSITES_CONSULTEES'";
    $requete = $this->connexion->prepare($sql);
    $requete->execute([$idUser]);

    if ($requete->fetchColumn() > 0) {
        $badges[] = [
            "nom" => "Prêt pour l'université",
            "icone" => "pret-universite"
        ];
    }

    return $badges;
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

    elseif ($points < 200) {

        return [

            "nom" => "Découvreur",
            "numero" => 2,
            "progression" => intval($points - 100)

        ];

    }

    elseif ($points < 300) {

        return [

            "nom" => "Visionnaire",
            "numero" => 3,
            "progression" => intval($points - 200) 

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


        "formationConsultee" => in_array(
            "FORMATION_CONSULTEE",
            $actions
        ),


        "universitesConsultees" => in_array(
            "UNIVERSITES_CONSULTEES",
            $actions
        )

    ];

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

                "badges" => count($badges)

            ],
            "parcours" => $parcours,

            "liste_badges" => $badges,

        ];
    }
}