<?php

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Headers: Content-Type");

require_once __DIR__ . "/../../Controllers/DashboardController.php";

try {

    if (!isset($_GET["id_user"])) {

        echo json_encode([

            "success" => false,
            "message" => "Paramètre id_user manquant."

        ]);

        exit;

    }

    $idUser = (int) $_GET["id_user"];

    $controller = new DashboardController();

    $resultat = $controller->recupererDashboard($idUser);

    echo json_encode($resultat);

} catch (Exception $e) {

    echo json_encode([

        "success" => false,
        "message" => $e->getMessage()

    ]);

}