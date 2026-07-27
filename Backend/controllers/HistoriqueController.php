<?php

require_once __DIR__ . "/../services/HistoriqueService.php";


class HistoriqueController
{

    private HistoriqueService $historiqueService;


    public function __construct()
    {

        $this->historiqueService = new HistoriqueService();

    }



    public function enregistrer()
    {

        $data = json_decode(
            file_get_contents("php://input"),
            true
        );


        $resultat = $this->historiqueService->enregistrerAction(
            $data["id_user"],
            $data["action"]
        );


        echo json_encode([

            "success" => $resultat,

            "message" => $resultat
                ? "Action enregistrée"
                : "Erreur"

        ]);

    }

}