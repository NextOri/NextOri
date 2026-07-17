const API_URL = "http://localhost/NextOri/backend/public";


export async function getQuestions(){

    const response = await fetch(

        `${API_URL}/questions.php`

    );

    if(!response.ok){

        throw new Error("Erreur chargement questions");

    }

    const resultat = await response.json();

    return resultat.data;

}



export async function getPropositions(id_question){

    const response = await fetch(

        `${API_URL}/propositions.php?id_question=${id_question}`

    );

    if(!response.ok){

        throw new Error("Erreur chargement propositions");

    }

    const resultat = await response.json();

    return resultat.data;

}



/* ========================= */
/* RESULTAT ORIENTATION */
/* ========================= */

export async function getOrientationResult(){

    const response = await fetch(

        "http://localhost/NextOri/backend/api/routes/orientation.php"

    );

    if(!response.ok){

        throw new Error("Erreur chargement résultat");

    }

    return await response.json();

}

export async function envoyerReponses(reponses){

    const response = await fetch(

        "http://localhost/NextOri/backend/api/routes/orientation.php",

        {

            method:"POST",

            headers:{

                "Content-Type":"application/json"

            },

            body:JSON.stringify({

                id_user:1,

                id_questionnaire:1,

                reponses:reponses.map((reponse)=>({

                    id_proposition:reponse.id_proposition

                }))

            })

        }

    );


    const texte = await response.text();


    console.log("REPONSE COMPLETE BACKEND :", texte);



    if(!response.ok){

        throw new Error("Erreur serveur : " + texte);

    }


    return JSON.parse(texte);

}