import { useLocation, useNavigate } from "react-router-dom";


const genererAnalyse = (
    reponses,
    typeChoix,
    options
) => {

    const codes = reponses.map(
        (reponse) => reponse.code
    );


    /*
     * ============================
     * POINTS FORTS
     * ============================
     */

    const pointsForts = [];


    const forces = {

        FORCE_ANALYSER: {
            titre: "Esprit d'analyse",
            texte:
                "Tu sembles à l'aise pour comprendre une situation, " +
                "examiner les différentes possibilités et rechercher " +
                "une solution avant d'agir."
        },

        FORCE_CREER: {
            titre: "Créativité",
            texte:
                "Tu sembles particulièrement à l'aise lorsque tu peux " +
                "imaginer, créer et proposer tes propres idées."
        },

        FORCE_AIDER: {
            titre: "Sens du contact",
            texte:
                "Tu sembles trouver naturellement ta place dans les " +
                "situations où il faut écouter, expliquer ou accompagner."
        },

        FORCE_ORGANISER: {
            titre: "Organisation",
            texte:
                "Tu sembles apprécier les situations qui demandent " +
                "de structurer, planifier et garder une vision claire."
        },

        FORCE_AGIR: {
            titre: "Initiative",
            texte:
                "Tu sembles être à l'aise lorsqu'il faut prendre des " +
                "initiatives et faire avancer concrètement un projet."
        }

    };


    codes.forEach((code) => {

        if (forces[code]) {

            pointsForts.push(
                forces[code]
            );

        }

    });


    /*
     * ============================
     * BLOCAGE PRINCIPAL
     * ============================
     */

    const blocages = {

        BLOCAGE_ERREUR: {
            titre: "La peur de te tromper",
            texte:
                "Tu sembles surtout chercher à éviter une mauvaise décision. " +
                "Cette volonté de bien choisir peut rendre la comparaison " +
                "plus difficile."
        },

        BLOCAGE_OPTIONS: {
            titre: "Plusieurs choix te correspondent",
            texte:
                "Ton hésitation ne vient pas forcément d'un manque d'intérêt. " +
                "Plusieurs possibilités semblent réellement t'attirer."
        },

        BLOCAGE_INFORMATION: {
            titre: "Un manque d'informations",
            texte:
                "Tu sembles avoir besoin d'informations plus concrètes " +
                "pour distinguer clairement les différentes possibilités."
        },

        BLOCAGE_CAPACITES: {
            titre: "Un doute sur tes capacités",
            texte:
                "Une partie de ton hésitation semble liée à la question " +
                "de savoir si tu possèdes le niveau ou les capacités nécessaires."
        },

        BLOCAGE_ENTOURAGE: {
            titre: "L'influence de ton entourage",
            texte:
                "Les attentes ou opinions de ton entourage semblent avoir " +
                "une influence importante sur ta décision."
        }

    };


    const blocageCode =
        codes.find(
            (code) => blocages[code]
        );


    const blocage =
        blocageCode
            ? blocages[blocageCode]
            : {
                titre: "Une décision encore ouverte",
                texte:
                    "Ton hésitation semble surtout venir du fait que " +
                    "plusieurs éléments doivent encore être mis en perspective."
            };


    /*
     * ============================
     * CRITÈRE DE DÉCISION
     * ============================
     */

    const criteres = {

        CRITERE_INTERET: {
            titre: "Ton intérêt personnel",
            texte:
                "Ce qui t'intéresse réellement semble être un élément " +
                "central dans ta décision."
        },

        CRITERE_CAPACITES: {
            titre: "Tes capacités",
            texte:
                "Tu accordes une importance particulière à la cohérence " +
                "entre tes capacités et le choix que tu feras."
        },

        CRITERE_DEBOUCHES: {
            titre: "Les débouchés",
            texte:
                "Les possibilités professionnelles et l'évolution future " +
                "semblent peser fortement dans ta décision."
        },

        CRITERE_CONDITIONS: {
            titre: "Les conditions de travail",
            texte:
                "Le cadre dans lequel tu travailleras semble être un critère " +
                "important pour toi."
        },

        CRITERE_STABILITE: {
            titre: "La stabilité",
            texte:
                "La sécurité et la stabilité semblent occuper une place " +
                "importante dans ton choix."
        }

    };


    const critereCode =
        codes.find(
            (code) => criteres[code]
        );


    const critere =
        critereCode
            ? criteres[critereCode]
            : null;


    /*
     * ============================
     * BESOIN POUR AVANCER
     * ============================
     */

    const besoins = {

        BESOIN_COMPARAISON: {
            titre: "Comparer tes options",
            texte:
                "Tu gagnerais probablement à comparer concrètement " +
                "les différentes possibilités plutôt qu'à essayer " +
                "de choisir immédiatement."
        },

        BESOIN_COMPATIBILITE: {
            titre: "Vérifier la compatibilité avec tes forces",
            texte:
                "Mettre tes points forts en relation avec chacune de " +
                "tes options pourrait t'aider à réduire ton hésitation."
        },

        BESOIN_REALITE: {
            titre: "Découvrir la réalité",
            texte:
                "Tu sembles avoir besoin de mieux comprendre ce que " +
                "chaque métier ou filière implique réellement."
        },

        BESOIN_DEBOUCHES: {
            titre: "Vérifier les perspectives",
            texte:
                "Les débouchés et les possibilités d'évolution pourraient " +
                "t'aider à départager tes différentes options."
        },

        BESOIN_RASSURANCE: {
            titre: "Te rassurer avant de décider",
            texte:
                "Tu sembles avoir besoin d'une vision suffisamment claire " +
                "pour pouvoir prendre ta décision avec davantage de confiance."
        }

    };


    const besoinCode =
        codes.find(
            (code) => besoins[code]
        );


    const besoin =
        besoinCode
            ? besoins[besoinCode]
            : null;


    /*
     * ============================
     * SYNTHÈSE
     * ============================
     */

    const nombreOptions =
        Array.isArray(options)
            ? options.length
            : 0;


    const typeTexte =
        typeChoix === "metier"
            ? "métiers"
            : "filières";


    let synthese =
        `Tu hésites actuellement entre ${nombreOptions} ${typeTexte}. `;


    if (blocage?.titre) {

        synthese +=
            `Ton hésitation semble surtout liée à ${blocage.titre.toLowerCase()}. `;

    }


    if (critere?.titre) {

        synthese +=
            `Dans ta décision, ${critere.titre.toLowerCase()} semble particulièrement important. `;

    }


    /*
     * ============================
     * CONSEILS
     * ============================
     */

    const conseils = [];


    if (besoin) {

        conseils.push({
            numero: "01",
            titre: besoin.titre,
            texte: besoin.texte
        });

    }


    if (
        blocageCode === "BLOCAGE_INFORMATION" ||
        besoinCode === "BESOIN_REALITE"
    ) {

        conseils.push({
            numero: "02",
            titre: "Explore les informations concrètes",
            texte:
                `Consulte le catalogue des ${typeTexte} pour comparer ` +
                "leurs caractéristiques et mieux comprendre leurs différences."
        });

    } else {

        conseils.push({
            numero: "02",
            titre: "Compare tes priorités",
            texte:
                "Pour chaque option, demande-toi ce qu'elle t'apporte " +
                "et ce qui correspond réellement à tes priorités actuelles."
        });

    }


    if (
        critereCode === "CRITERE_DEBOUCHES" ||
        besoinCode === "BESOIN_DEBOUCHES"
    ) {

        conseils.push({
            numero: "03",
            titre: "Regarde les perspectives",
            texte:
                "Compare les débouchés et les possibilités d'évolution " +
                "avant de prendre ta décision."
        });

    } else {

        conseils.push({
            numero: "03",
            titre: "Passe de la réflexion à l'exploration",
            texte:
                "Utilise maintenant les informations concrètes disponibles " +
                "pour confronter tes premières impressions à la réalité."
        });

    }


    return {

        pointsForts,

        blocage,

        critere,

        besoin,

        synthese,

        conseils,

        options,

        typeChoix

    };

};

function ResultatHesitation() {

    const location = useLocation();
    const navigate = useNavigate();

    const {
        typeChoix,
        metiersSelectionnes = [],
        filieresSelectionnees = [],
        reponsesHesitation = []
    } = location.state || {};

    const options =
    typeChoix === "metier"
        ? metiersSelectionnes
        : filieresSelectionnees;

const analyse = genererAnalyse(
    reponsesHesitation,
    typeChoix,
    options
);

    if (!typeChoix) {

        return (
            <div>

                <h1>
                    Analyse introuvable
                </h1>

                <p>
                    Cette analyse n'est plus disponible.
                </p>

                <button
                    type="button"
                    onClick={() => navigate("/hesitation")}
                >
                    Refaire une analyse
                </button>

            </div>
        );

    }

   
            

    return (

        <div>

            <h1>
                Résultat de ton analyse
            </h1>

            <p>
                Type :{" "}
                {typeChoix === "metier"
                    ? "Métiers"
                    : "Filières"
                }
            </p>


            <h2>
                Tes choix
            </h2>

            {options.map((option) => (

                <p key={option.id}>
                    {option.nom}
                </p>

            ))}


            <h2>
                Tes réponses
            </h2>

            {reponsesHesitation.map((reponse) => (

                <p key={reponse.id_question}>
                    Question {reponse.id_question} :
                    réponse {reponse.id_reponse}
                </p>

            ))}

        </div>

    );

}

export default ResultatHesitation;