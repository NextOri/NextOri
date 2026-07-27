const API_URL = "http://localhost/NextOri/backend/api/routes/historique.php";


export const enregistrerAction = async (action) => {

    try {

        const response = await fetch(
            API_URL,
            {
                method: "POST",

                headers: {
                    "Content-Type": "application/json"
                },

                body: JSON.stringify({

                    id_user: 1,

                    action: action

                })

            }
        );


        const data = await response.json();

        return data;


    } catch(error) {

        console.error(
            "Erreur historique :",
            error
        );

        throw error;

    }

};