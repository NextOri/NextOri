import { lancerOrientation } from "../services/orientationService";

function Test() {

    async function testerAPI() {

        const donnees = {

            id_user: 1,

            id_questionnaire: 1,

            reponses: [

                { id_proposition: 1 },
                { id_proposition: 2 },
                { id_proposition: 3 },
                { id_proposition: 4 },
                { id_proposition: 5 }

            ]

        };

        try {

            const resultat = await lancerOrientation(donnees);

            console.log(resultat);

            alert("Communication React → API réussie !");

        } catch (erreur) {

            console.error(erreur);

            alert("Erreur de communication avec l'API.");

        }

    }

    return (

        <div>

            <h1>Test de communication API</h1>

            <button onClick={testerAPI}>

                Tester l'API NextOri

            </button>

        </div>

    );

}

export default Test;