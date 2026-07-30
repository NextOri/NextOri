<?php

require_once __DIR__ . "/../../services/UserService.php";

header("Access-Control-Allow-Origin: http://localhost:5173");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") {
    http_response_code(200);
    exit();
}

if ($_SERVER["REQUEST_METHOD"] !== "POST") {

    http_response_code(405);

    echo json_encode([
        "success" => false,
        "message" => "Méthode non autorisée."
    ]);

    exit();

}

$donnees = json_decode(file_get_contents("php://input"), true);

if (
    empty($donnees["nom"]) ||
    empty($donnees["email"]) ||
    empty($donnees["mot_de_passe"]) ||
    empty($donnees["pays"]) ||
    empty($donnees["niveau_etude"])
) {

    http_response_code(400);

    echo json_encode([
        "success" => false,
        "message" => "Tous les champs sont obligatoires."
    ]);

    exit();

}

$userService = new UserService();

$resultat = $userService->register(
    $donnees["nom"],
    $donnees["email"],
    $donnees["mot_de_passe"],
    $donnees["pays"],
    $donnees["niveau_etude"]
);

if ($resultat) {

    echo json_encode([
        "success" => true,
        "message" => "Compte créé avec succès.",
        "utilisateur" => $resultat
    ]);

} else {

    http_response_code(409);

    echo json_encode([
        "success" => false,
        "message" => "Cet email est déjà utilisé.",
        
    ]);

}