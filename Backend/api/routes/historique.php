<?php

header("Content-Type: application/json");

header("Access-Control-Allow-Origin: *");

header("Access-Control-Allow-Methods: POST");

header("Access-Control-Allow-Headers: Content-Type");


require_once __DIR__ . "/../../controllers/HistoriqueController.php";


try {


    $controller = new HistoriqueController();


    $controller->enregistrer();



} catch(Exception $e) {


    echo json_encode([

        "success" => false,

        "message" => $e->getMessage()

    ]);

}