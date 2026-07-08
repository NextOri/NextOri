<?php

require_once "../services/MetierService.php";


$service = new MetierService();


$resultat =
    $service->formaterRecommandations("IS");


header('Content-Type: application/json');


echo json_encode(
    $resultat,
    JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE
);