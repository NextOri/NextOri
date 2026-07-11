<?php

require_once __DIR__ . "/../services/OrientationService.php";

class OrientationController
{
    private OrientationService $orientationService;

    public function __construct()
    {
        $this->orientationService = new OrientationService();
    }

    /**
     * Point d'entrée de l'API Orientation
     */
    public function executer(): void
    {
        header("Content-Type: application/json; charset=UTF-8");

        try {

            // Lecture des données JSON envoyées
            $json = file_get_contents("php://input");

            $donnees = json_decode($json, true);

            // Vérification de la validité du JSON
            if ($donnees === null) {

                http_response_code(400);

                echo json_encode([
                    "success" => false,
                    "message" => "Aucune donnée JSON reçue."
                ]);

                return;
            }

            // Vérification des paramètres obligatoires
            if (
                !isset($donnees["id_user"]) ||
                !isset($donnees["id_questionnaire"]) ||
                !isset($donnees["reponses"])
            ) {

                http_response_code(400);

                echo json_encode([
                    "success" => false,
                    "message" => "Paramètres manquants."
                ]);

                return;
            }

            // Exécution du moteur NextOri
            $resultat = $this->orientationService->executerOrientation(

                (int)$donnees["id_user"],

                (int)$donnees["id_questionnaire"],

                $donnees["reponses"]

            );

            // Réponse
            echo json_encode([

                "success" => true,

                "data" => $resultat

            ], JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);

        } catch (Throwable $e) {

            http_response_code(500);

            echo json_encode([

                "success" => false,

                "message" => $e->getMessage()

            ]);

        }
    }
}