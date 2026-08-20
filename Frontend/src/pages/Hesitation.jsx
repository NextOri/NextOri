import { useState } from "react";
import { useNavigate } from "react-router-dom";

function Hesitation() {

    const navigate = useNavigate();

    const [etape, setEtape] = useState("presentation");
    const [typeChoix, setTypeChoix] = useState(null);
   const [metiersSelectionnes, setMetiersSelectionnes] = useState([]);
    const [filieresSelectionnees, setFilieresSelectionnees] = useState([]);
    const [questionActuelle, setQuestionActuelle] = useState(0);
    const [reponsesHesitation, setReponsesHesitation] = useState([]);
    const [etapeAnalyse, setEtapeAnalyse] = useState(0);


    const questionsHesitation = [
    {
        id: 1,
        question: "Question 1",
        reponses: [
            { id: 1, texte: "Réponse 1" },
            { id: 2, texte: "Réponse 2" },
            { id: 3, texte: "Réponse 3" },
            { id: 4, texte: "Réponse 4" },
            { id: 5, texte: "Réponse 5" }
        ]
    },

    {
        id: 2,
        question: "Question 2",
        reponses: [
            { id: 1, texte: "Réponse 1" },
            { id: 2, texte: "Réponse 2" },
            { id: 3, texte: "Réponse 3" },
            { id: 4, texte: "Réponse 4" },
            { id: 5, texte: "Réponse 5" }
        ]
    },

    {
        id: 3,
        question: "Question 3",
        reponses: [
            { id: 1, texte: "Réponse 1" },
            { id: 2, texte: "Réponse 2" },
            { id: 3, texte: "Réponse 3" },
            { id: 4, texte: "Réponse 4" },
            { id: 5, texte: "Réponse 5" }
        ]
    },

    {
        id: 4,
        question: "Question 4",
        reponses: [
            { id: 1, texte: "Réponse 1" },
            { id: 2, texte: "Réponse 2" },
            { id: 3, texte: "Réponse 3" },
            { id: 4, texte: "Réponse 4" },
            { id: 5, texte: "Réponse 5" }
        ]
    },

    {
        id: 5,
        question: "Question 5",
        reponses: [
            { id: 1, texte: "Réponse 1" },
            { id: 2, texte: "Réponse 2" },
            { id: 3, texte: "Réponse 3" },
            { id: 4, texte: "Réponse 4" },
            { id: 5, texte: "Réponse 5" }
        ]
    }
];

    /*
     * Étape 1 :
     * Présentation du modèle.
     */
    const afficherPresentation = () => {

        return (

            <div>

                <h1>
                    Tu hésites entre plusieurs choix ?
                </h1>

                <p>
                    Tu as plusieurs métiers ou plusieurs filières
                    en tête et tu ne sais pas encore lequel
                    correspond le mieux à ta situation ?
                </p>

                <p>
                    Pas besoin de choisir tout de suite.
                    NextOri va t'aider à comprendre ton hésitation,
                    tes points forts, ce qui influence ta décision
                    et les prochaines étapes qui pourraient
                    t'aider à avancer.
                </p>


                <section>

                    <h2>
                        Comment fonctionne cette analyse ?
                    </h2>

                    <div>

                        <h3>
                            1. Présente-nous tes choix
                        </h3>

                        <p>
                            Sélectionne les métiers ou les filières
                            entre lesquels tu hésites.
                        </p>

                    </div>


                    <div>

                        <h3>
                            2. Réponds à 5 questions
                        </h3>

                        <p>
                            Des questions courtes pour mieux comprendre
                            tes motivations, tes points forts,
                            tes blocages et ce qui influence ton choix.
                        </p>

                    </div>


                    <div>

                        <h3>
                            3. NextOri analyse ta situation
                        </h3>

                        <p>
                            Tes réponses et les choix que tu envisages
                            sont analysés pour construire une réflexion
                            personnalisée.
                        </p>

                    </div>


                    <div>

                        <h3>
                            4. Découvre ta prochaine direction
                        </h3>

                        <p>
                            NextOri t'explique ce qui semble cohérent
                            avec ta situation et te propose des pistes
                            concrètes pour avancer.
                        </p>

                    </div>

                </section>


                <section>

                    <h2>
                        Une analyse différente du test RIASEC
                    </h2>

                    <p>
                        Le RIASEC permet de mieux comprendre ton profil
                        professionnel.
                    </p>

                    <p>
                        Cette analyse répond à une autre question :
                    </p>

                    <strong>
                        « Parmi les choix que j'envisage aujourd'hui,
                        lequel semble le plus cohérent avec ma situation
                        et pourquoi ? »
                    </strong>

                </section>


                <button
                    type="button"
                    onClick={() => setEtape("type")}
                >
                    Commencer mon analyse
                </button>

            </div>

        );

    };


    /*
     * Étape 2 :
     * L'utilisateur indique s'il hésite
     * entre des métiers ou des filières.
     *
     * Pour l'instant, cette étape est volontairement simple.
     * Nous la compléterons ensuite.
     */
    const optionsSelectionnees =
    typeChoix === "metier"
        ? metiersSelectionnes
        : filieresSelectionnees;

const afficherChoixType = () => {

    const choisirType = (type) => {

    setTypeChoix(type);

    setEtape("options");
       

    };


    return (

        <div>

            <h1>
                Entre quoi hésites-tu ?
            </h1>

            <p>
                Choisis ce que tu souhaites explorer avec NextOri.
            </p>


            <button
                type="button"
                onClick={() => choisirType("metier")}
            >
                Métiers
            </button>


            <button
                type="button"
                onClick={() => choisirType("filiere")}
            >
                Filières
            </button>


            <button
                type="button"
                onClick={() => setEtape("presentation")}
            >
                ← Retour
            </button>

        </div>

    );

};

if (etape === "options") {

    const options = typeChoix === "metier"
        ? [
            { id: 1, nom: "Développeur web" },
            { id: 2, nom: "Data Analyst" },
            { id: 3, nom: "Designer UX/UI" },
            { id: 4, nom: "Chef de projet" }
        ]
        : [
            { id: 1, nom: "Informatique" },
            { id: 2, nom: "Mathématiques" },
            { id: 3, nom: "Design" },
            { id: 4, nom: "Gestion de projet" }
        ];


    const changerSelection = (option) => {

    if (typeChoix === "metier") {

        setMetiersSelectionnes((actuelles) => {

            const dejaSelectionnee =
                actuelles.some(
                    (item) => item.id === option.id
                );

            if (dejaSelectionnee) {

                return actuelles.filter(
                    (item) => item.id !== option.id
                );

            }

            if (actuelles.length >= 3) {
                return actuelles;
            }

            return [
                ...actuelles,
                option
            ];

        });

    } else {

        setFilieresSelectionnees((actuelles) => {

            const dejaSelectionnee =
                actuelles.some(
                    (item) => item.id === option.id
                );

            if (dejaSelectionnee) {

                return actuelles.filter(
                    (item) => item.id !== option.id
                );

            }

            if (actuelles.length >= 3) {
                return actuelles;
            }

            return [
                ...actuelles,
                option
            ];

        });

    }

};

    const continuer = () => {

        if (optionsSelectionnees.length < 2) {

            return;

        }

        setEtape("questions");

    };


    return (

        <div>

            <h1>
                {typeChoix === "metier"
                    ? "Quels métiers envisages-tu ?"
                    : "Quelles filières envisages-tu ?"
                }
            </h1>


            <p>
                Sélectionne entre 2 et 3 choix
                que tu souhaites comparer.
            </p>


            <p>
                {optionsSelectionnees.length} / 3 sélectionné(s)
            </p>


            <div>

                {options.map((option) => {

                    const selectionnee =
                        optionsSelectionnees.some(
                            (item) =>
                                item.id === option.id
                        );


                    return (

                        <button
                            key={option.id}
                            type="button"
                            onClick={() =>
                                changerSelection(option)
                            }
                        >

                            {selectionnee
                                ? "✓ "
                                : ""
                            }

                            {option.nom}

                        </button>

                    );

                })}

            </div>


            <button
                type="button"
                onClick={() => setEtape("type")}
            >
                ← Retour
            </button>


            <button
                type="button"
                disabled={
                    optionsSelectionnees.length < 2
                }
                onClick={() => {

    setQuestionActuelle(0);
    setReponsesHesitation([]);
    setEtape("questions");

}}
            >
                Continuer
            </button>

        </div>

    );

}


if (etape === "questions") {

    const question =
        questionsHesitation[questionActuelle];

    return (
        <div className="hesitation-page">

            <h1>
                Question {questionActuelle + 1} / 5
            </h1>

            <h2>
                {question.question}
            </h2>

            <div>

                {question.reponses.map((reponse) => (

    <button
        key={reponse.id}
        type="button"
        onClick={() => {

            setReponsesHesitation((anciennes) => {

                const nouvelles =
                    anciennes.filter(
                        (item) =>
                            item.id_question !== question.id
                    );

                return [
                    ...nouvelles,
                    {
                        id_question: question.id,
                        id_reponse: reponse.id
                    }
                ];

            });

        }}
    >
        {reponse.texte}
    </button>

    

))}

            </div>

            <button
    type="button"
    disabled={
        !reponsesHesitation.some(
            (item) =>
                item.id_question === question.id
        )
    }
    onClick={() => {

        if (
            questionActuelle <
            questionsHesitation.length - 1
        ) {

            setQuestionActuelle(
                questionActuelle + 1
            );

        } else {

            setEtape("analyse");

        }

    }}
>
    {questionActuelle ===
    questionsHesitation.length - 1
        ? "Analyser ma situation"
        : "Continuer →"
    }
</button>

        </div>
    );
}


if (etape === "analyse") {

    const etapesAnalyse = [
        "Compréhension de tes choix",
        "Analyse de tes points forts",
        "Identification de ce qui peut te bloquer",
        "Analyse des facteurs qui influencent ta décision",
        "Mise en perspective de tes choix",
        "Préparation de tes prochaines étapes"
    ];

    const etapeActuelle =
        etapesAnalyse[etapeAnalyse];

    return (

        <div className="hesitation-analyse-page">

            <div className="hesitation-analyse-card">

                <div className="hesitation-analyse-orbe">

                    <div className="hesitation-analyse-orbe-core"></div>

                </div>


                <span className="hesitation-analyse-label">
                    Analyse NextOri
                </span>


                <h1>
                    J’analyse ta situation...
                </h1>


                <p>
                    {etapeActuelle}
                </p>


                <div className="hesitation-analyse-steps">

                    {etapesAnalyse.map(
                        (etape, index) => (

                            <div
                                key={etape}
                                className={
                                    `hesitation-analyse-step ${
                                        index < etapeAnalyse
                                            ? "terminee"
                                            : index === etapeAnalyse
                                                ? "active"
                                                : ""
                                    }`
                                }
                            >

                                <span className="hesitation-analyse-step-indicator">
                                    {index < etapeAnalyse
                                        ? "✓"
                                        : index + 1
                                    }
                                </span>

                                <span>
                                    {etape}
                                </span>

                            </div>

                        )
                    )}

                </div>


                <div className="hesitation-analyse-loader">

                    <span></span>
                    <span></span>
                    <span></span>

                </div>

            </div>

        </div>

    );

}

     
    /*
     * Petit routeur interne du module.
     */
    if (etape === "presentation") {

        return afficherPresentation();

    }


    if (etape === "type") {

        return afficherChoixType();

    }


    return null;
}

export default Hesitation;