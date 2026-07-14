import { useEffect, useState } from "react";

import { getQuestions, getPropositions } from "../services/api";

import "../styles/Test.css";

import AnswerCard from "../components/AnswerCard";




function Test(){

    const [questions, setQuestions] = useState([]);

    const [propositions, setPropositions] = useState([]);

    const [index, setIndex] = useState(0);

    const [reponses, setReponses] = useState([]);

    const [choix, setChoix] = useState(null);

    const [loading, setLoading] = useState(true);



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



    function choisirReponse(valeur){

        setChoix(valeur);

    }



    function suivant(){


        if(choix === null){

            alert("Veuillez choisir une réponse.");

            return;

        }


        const nouvelleReponse = {

            id_question: question.id_question,

            id_proposition: choix

        };


        setReponses([

            ...reponses,

            nouvelleReponse

        ]);


        setChoix(null);



        if(index < questions.length - 1){

            setIndex(index + 1);

        }

        else{

            console.log("Réponses envoyées :", [

                ...reponses,

                nouvelleReponse

            ]);

            alert("Test terminé");

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
choix === proposition.id_proposition
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



<button

className="next-button"

onClick={suivant}

>

Suivant

</button>


</div>

);

}


export default Test;