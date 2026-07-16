import { useEffect, useState } from "react";

import { useNavigate } from "react-router-dom";

import {getQuestions, getPropositions, envoyerReponses} from "../services/api";


import "../styles/Test.css";

import AnswerCard from "../components/AnswerCard";




function Test(){

    const [questions, setQuestions] = useState([]);

    const [propositions, setPropositions] = useState([]);

    const [index, setIndex] = useState(0);

    const [reponses, setReponses] = useState([]);

    const [choix, setChoix] = useState(null);

    const [loading, setLoading] = useState(true);

    const navigate = useNavigate();

    useEffect(()=>{

        getQuestions()

        .then((data)=>{

            setQuestions(data);

            setLoading(false);

        })

        .catch((error)=>{

            console.error(error);

            setLoading(false);

        });


    },[]);


    useEffect(()=>{


     if(questions.length > 0){


        getPropositions(

            questions[index].id_question

        )

        .then(data=>{

            setPropositions(data);

        })

        .catch(error=>{

            console.error(error);

        });


     }


    },[index, questions]);



    if(loading){

        return (

            <h2>

                Chargement du test...

            </h2>

        );

    }



    const question = questions[index];



   function choisirReponse(idProposition){

    setChoix(idProposition);

    const nouvellesReponses = [...reponses];

    nouvellesReponses[index] = {

        id_question: question.id_question,

        id_proposition: idProposition

    };

    setReponses(nouvellesReponses);
   
    console.log("Réponses actuelles :", idProposition);
    setChoix(idProposition)
}



function suivant() {

    if (choix === null) {
        alert("Veuillez choisir une réponse.");
        return;
    }

    if (index < questions.length - 1) {

        setChoix(null);
        setIndex(index + 1);

    } else {

        envoyerReponses(reponses)

            .then((resultat) => {

                navigate("/result", {
                    state: resultat
                });

            })

            .catch((error) => {

                console.error(error);

                alert("Erreur lors du calcul.");

            });

    }

}
   
function precedent(){

    if(index > 0){

        setIndex(index - 1);

        const ancienneReponse = reponses[index - 1];

        setChoix(

            ancienneReponse

            ? ancienneReponse.id_proposition

            : null

        );

    }

}


   return (

<div className="test-page">


<header className="test-header">

<h1>
NextOri
</h1>

<p>
Test d'orientation RIASEC
</p>

</header>

<div className="test-introduction">

    <h1>
        Découvre ton profil professionnel
    </h1>

    <p>
        Réponds aux questions suivantes pour mieux comprendre 
        tes centres d'intérêt et découvrir les métiers qui te correspondent.
    </p>

</div>



<div className="progress-container">


    <div className="progress-info">

        <span>
            Question {index + 1} sur {questions.length}
        </span>

        <span>
            {Math.round(((index + 1) / questions.length) * 100)}%
        </span>


    </div>



    <div className="progress-bar">


        <div

        className="progress-fill"

        style={{
            width:`${((index + 1) / questions.length) * 100}%`
        }}

        >

        </div>


    </div>


</div>


<div className="question-card">


<h2>

{question.texte}

</h2>


<div className="answers">


{

propositions.map((proposition)=>(


<button

key={proposition.id_proposition}

className={
reponses[index]?.id_proposition === proposition.id_proposition
? "answer active"
: "answer"
}

onClick={()=>choisirReponse(proposition.id_proposition)}

>


<span>

{proposition.lettre}

</span>


{proposition.libelle}


</button>


))

}


</div>


</div>



<div className="navigation-buttons">

    <button

        className="previous-button"

        onClick={precedent}

        disabled={index === 0}

    >

        Précédent

    </button>


    <button

        className="next-button"

        onClick={suivant}

    >

        {index === questions.length - 1

            ? "Terminer"

            : "Suivant"}

    </button>

</div>


</div>

);

}


export default Test;