const API_URL = "http://localhost/NextOri/backend/public";


export async function getQuestions(){


    const response = await fetch(

        `${API_URL}/questions.php`

    );


    if(!response.ok){

        throw new Error("Erreur chargement questions");

    }
    
    const resultat= await response.json();

    return resultat.data;

}

export async function getPropositions(id_question){


    const response = await fetch(

        `http://localhost/NextOri/backend/public/propositions.php?id_question=${id_question}`

    );


    if(!response.ok){

        throw new Error("Erreur chargement propositions");

    }


    const resultat = await response.json();


    return resultat.data;


}