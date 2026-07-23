import Confetti from "react-confetti";
import { useEffect, useState } from "react";

import { useLocation, useNavigate } from "react-router-dom";

import "../styles/Result.css";




function Result(){

    const [showConfetti, setShowConfetti] = useState(true);


useEffect(()=>{

    const timer = setTimeout(()=>{

        setShowConfetti(false);

    },4000);


    return ()=>clearTimeout(timer);


},[]);


    const location = useLocation();

    const navigate = useNavigate();


    const resultatInitial = location.state?.data;

    console.log("STATE RESULT :", location.state);
console.log("DATA RESULT :", resultatInitial);

    const [resultat, setResultat] = useState(resultatInitial);

    const [chargement, setChargement] = useState(true);

    useEffect(() => {

    if (!resultat) {
        setChargement(true);

        fetch("http://localhost/NextOri/backend/api/routes/resultats.php?id_user=1")
            .then(response => response.json())
            .then(data => {

                if (data.success) {

                    setResultat(data.data);
                    setChargement(false);

                }

            })
            .catch(error => {

                console.error(
                    "Erreur récupération résultat :",
                    error
                );

            });
    }
    
}, [resultat]);

//  fetch("http://localhost/NextOri/backend/api/routes/resultats.php?id_user=1")


    /*
    =====================================
    COMPATIBILITE METIER
    =====================================
    */

    function afficherCompatibilite(score){

        const pourcentage = Math.round((score / 8) * 95);


        let badge = "";

        let couleur = "";


        if(pourcentage >= 85){

            badge = "Très compatible";

            couleur = "#0D1B2A";

        }

        else if(pourcentage >= 55){

            badge = "Compatible";

            couleur = "#1E3A8A";

        }

        else{

            badge = "À explorer";

            couleur = "#98A2B3";

        }


        return {

            pourcentage,

            badge,

            couleur

        };

    }





    /*
    =====================================
    PROFILS RIASEC
    =====================================
    */


   const profils = {

    RI:{

        nom:"Réaliste • Investigateur",

        description:
        "Vous aimez résoudre des problèmes concrets grâce à l'observation, la logique et les activités techniques."

    },

    RA:{

        nom:"Réaliste • Artistique",

        description:
        "Vous aimez créer, construire et transformer des idées en réalisations concrètes."

    },

    RS:{

        nom:"Réaliste • Social",

        description:
        "Vous appréciez les activités pratiques tout en aidant les autres."

    },

    RE:{

        nom:"Réaliste • Entreprenant",

        description:
        "Vous aimez agir, diriger et relever des défis concrets."

    },

    RC:{

        nom:"Réaliste • Conventionnel",

        description:
        "Vous êtes organisé, méthodique et aimez les activités pratiques."

    },

    IR:{

        nom:"Investigateur • Réaliste",

        description:
        "Vous aimez comprendre, expérimenter et résoudre des problèmes."

    },

    IA:{

        nom:"Investigateur • Artistique",

        description:
        "Vous combinez créativité et esprit scientifique."

    },

    IS:{

        nom:"Investigateur • Social",

        description:
        "Vous aimez analyser et transmettre vos connaissances."

    },

    IE:{

        nom:"Investigateur • Entreprenant",

        description:
        "Vous aimez innover et porter des projets ambitieux."

    },

    IC:{

        nom:"Investigateur • Conventionnel",

        description:
        "Vous êtes rigoureux et aimez les activités intellectuelles."

    },

    AR:{

        nom:"Artistique • Réaliste",

        description:
        "Vous aimez créer avec des réalisations concrètes."

    },

    AI:{

        nom:"Artistique • Investigateur",

        description:
        "Vous aimez créer tout en recherchant des solutions nouvelles."

    },

    AS:{

        nom:"Artistique • Social",

        description:
        "Vous aimez exprimer votre créativité au service des autres."

    },

    AE:{

        nom:"Artistique • Entreprenant",

        description:
        "Vous aimez innover, convaincre et entreprendre."

    },

    AC:{

        nom:"Artistique • Conventionnel",

        description:
        "Vous savez allier créativité et organisation."

    },

    SR:{

        nom:"Social • Réaliste",

        description:
        "Vous aimez aider les autres à travers des actions concrètes."

    },

    SI:{

        nom:"Social • Investigateur",

        description:
        "Vous aimez comprendre les personnes et les accompagner."

    },

    SA:{

        nom:"Social • Artistique",

        description:
        "Vous aimez transmettre et créer des liens."

    },

    SE:{

        nom:"Social • Entreprenant",

        description:
        "Vous aimez diriger des équipes et accompagner les personnes."

    },

    SC:{

        nom:"Social • Conventionnel",

        description:
        "Vous êtes organisé et aimez travailler avec les autres."

    },

    ER:{

        nom:"Entreprenant • Réaliste",

        description:
        "Vous aimez prendre des décisions et agir."

    },

    EI:{

        nom:"Entreprenant • Investigateur",

        description:
        "Vous aimez innover et développer de nouveaux projets."

    },

    EA:{

        nom:"Entreprenant • Artistique",

        description:
        "Vous aimez créer et convaincre."

    },

    ES:{

        nom:"Entreprenant • Social",

        description:
        "Vous aimez diriger, communiquer et motiver les autres."

    },

    EC:{

        nom:"Entreprenant • Conventionnel",

        description:
        "Vous aimez gérer et organiser."

    },

    CR:{

        nom:"Conventionnel • Réaliste",

        description:
        "Vous êtes méthodique et aimez les tâches concrètes."

    },

    CI:{

        nom:"Conventionnel • Investigateur",

        description:
        "Vous aimez analyser avec précision."

    },

    CA:{

        nom:"Conventionnel • Artistique",

        description:
        "Vous aimez organiser des projets créatifs."

    },

    CS:{

        nom:"Conventionnel • Social",

        description:
        "Vous aimez organiser le travail d'équipe."

    },

    CE:{

        nom:"Conventionnel • Entreprenant",

        description:
        "Vous aimez gérer, planifier et diriger."

    }

};



    /*
    =====================================
    SALAIRE
    =====================================
    */


    function afficherSalaire(min,max){

        return `${Number(min).toLocaleString()} FCFA - ${Number(max).toLocaleString()} FCFA`;

    }




    /*
    =====================================
    CAS UTILISATEUR SANS RESULTAT
    =====================================
    */
     if (chargement) {
    return (
        <div className="result-loading">
            Chargement des résultats...
        </div>
    );
     }

    if(!resultat){

        return (

            <div className="result-empty">


                <h1>

                    Aucun résultat disponible

                </h1>


                <p>

                    Vous n'avez pas encore effectué votre test
                    d'orientation.

                </p>


                <button

                className="start-test-button"

                onClick={()=>navigate("/test")}

                >

                    Faire le test

                </button>


            </div>

        );

    }




    const profil = resultat.profil;


    const profilInfo = profils[profil.principal] || {

        nom:"Profil RIASEC",

        description:
        "Votre profil professionnel a été identifié selon vos réponses."

    };

    return (


       

        <div className="result-page">
             {
    showConfetti && (

        <Confetti

            numberOfPieces={250}

            recycle={false}

            colors={[
                "#0D1B2A",
                "#F4B400",
                "#1E3A8A",
                "#F2F4F7"
            ]}

        />

    )
}

            {/* =====================================
                HEADER RESULTAT
            ===================================== */}

            <header className="result-header">


                <h1>

                    Votre résultat NextOri

                </h1>


                <p>

                    Découvrez les carrières qui correspondent
                    à votre profil.

                </p>


            </header>





            {/* =====================================
                CARTE PROFIL RIASEC
            ===================================== */}


            <section className="profile-result">


                <div className="success-icon">

                    🎉

                </div>



                <h2>

                    Félicitations !

                </h2>



                <p className="profile-introduction">

                    Votre profil dominant est

                </p>




                <div className="profile-code">

                    {profil.principal}

                </div>




                <h3>

                    {profilInfo.nom}

                </h3>




                <p className="profile-description">

                    {profilInfo.description}

                </p>




                <p className="profile-explication">

                    Nous avons analysé vos réponses et identifié
                    les métiers qui correspondent le mieux à votre
                    personnalité, vos centres d'intérêt et votre
                    manière de travailler.

                    <br/><br/>

                    Explorez maintenant les carrières proposées
                    pour découvrir celles qui vous correspondent.

                </p>





                <button

                    className="profile-button"

                    onClick={()=>navigate(

                        "/profil-riasec",

                        {

                            state: {
                                resultat: resultat
                            }

                        }

                    )}

                >

                    Détails du profil

                </button>



            </section>

{/* =====================================
    SCORES RIASEC
===================================== */}


<section className="scores-section">


    <h2>

        Vos scores RIASEC

    </h2>


    <p>

        Ces scores représentent vos centres d'intérêt
        pour chaque dimension professionnelle.

    </p>



    <div className="scores-list">


    {

    Object.entries(profil.scores).map(

        ([lettre, score])=>(


        <div

        className="score-item"

        key={lettre}

        >


            <div className="score-header">


                <span>

                    {lettre}

                </span>


                <strong>

                    {score}

                </strong>


            </div>




            <div className="score-bar">


                <div

                className="score-progress"

                style={{

                    width:`${(score / 10) * 100}%`

                }}

                >

                </div>


            </div>



        </div>


        )

    )


    }


    </div>


</section>

            {/* =====================================
                RECOMMANDATIONS METIERS
            ===================================== */}


            <section className="jobs-section">


                <h2>

                    Métiers recommandés

                </h2>





                {/* ============================
                    METIERS PRINCIPAUX
                ============================ */}


                <h3 className="category-title">

                    ⭐ Carrières principales

                </h3>



                <div className="jobs-list">


                {

                resultat.recommandations.principaux.map(

                    (metier)=>(


                    <article

                    className="job-card"

                    key={metier.id_metier}

                    >



                        <div className="job-header">


                            <h3>

                                {metier.nom}

                            </h3>




                            <div

                            className="compatibilite"

                            style={{

                                backgroundColor:

                                afficherCompatibilite(

                                    metier.score_compatibilite

                                ).couleur

                            }}

                            >


                                <span>

                                    {

                                    afficherCompatibilite(

                                        metier.score_compatibilite

                                    ).badge

                                    }

                                </span>



                                <strong>

                                    {

                                    afficherCompatibilite(

                                        metier.score_compatibilite

                                    ).pourcentage

                                    }%

                                </strong>



                            </div>



                        </div>





                        <p className="job-description">

                            📝 {metier.description}

                        </p>






                        <div className="job-information">


                            <p>

                                📂 <strong>Secteur :</strong>

                                {" "}

                                {metier.secteur}

                            </p>




                            <p>

                                🎓 <strong>Niveau d'étude :</strong>

                                {" "}

                                {metier.niveau_etude}

                            </p>




                            <p>

                                💰 <strong>Salaire :</strong>

                                {" "}

                                {afficherSalaire(

                                    metier.salaire_min,

                                    metier.salaire_max

                                )}

                            </p>



                        </div>






                        <button

                        className="job-button"

                        onClick={()=>navigate(

                            "/formations",

                            {

                                state:{
                                    metier: metier,

                                    resultat: resultat
                                }

                            }

                        )}

                        >

                            Explorer cette carrière

                        </button>




                    </article>


                    )

                )


                }


                </div>









                {/* ============================
                    METIERS SECONDAIRES
                ============================ */}



                <h3 className="category-title secondary-title">

                    Autres carrières compatibles

                </h3>




               {

resultat.recommandations.secondaires.length > 0 ? (

    <div className="jobs-list">


    {

    resultat.recommandations.secondaires.map(

        (metier)=>(


            <article

            className="job-card secondary-card"

            key={metier.id_metier}

            >


                <div className="job-header">


                    <h3>

                        {metier.nom}

                    </h3>



                    <div

                    className="compatibilite"

                    style={{

                        backgroundColor:

                        afficherCompatibilite(

                            metier.score_compatibilite

                        ).couleur

                    }}

                    >

                        <span>

                            {

                            afficherCompatibilite(

                                metier.score_compatibilite

                            ).badge

                            }

                        </span>


                        <strong>

                            {

                            afficherCompatibilite(

                                metier.score_compatibilite

                            ).pourcentage

                            }%

                        </strong>


                    </div>


                </div>



                <p>

                    📝 {metier.description}

                </p>



                <div className="job-information">


                    <p>

                        📂 <strong>Secteur :</strong>

                        {" "}

                        {metier.secteur}

                    </p>



                    <p>

                        🎓 <strong>Niveau d'étude :</strong>

                        {" "}

                        {metier.niveau_etude}

                    </p>



                    <p>

                        💰 <strong>Salaire :</strong>

                        {" "}

                        {afficherSalaire(

                            metier.salaire_min,

                            metier.salaire_max

                        )}

                    </p>


                </div>



                <button

                className="job-button"

                onClick={()=>navigate(

                    "/formations",

                    {

                        state:metier

                    }

                )}

                >

                    Explorer cette carrière

                </button>


            </article>


        )

    )


    }


    </div>


) : (

    <div className="no-secondary">

        <p>

            Aucun métier secondaire trouvé pour votre profil.

        </p>

        <span>

            Nous vous recommandons d'explorer les carrières principales proposées ci-dessus.

        </span>

    </div>

)

}

            </section>

            {/* =====================================
                ACTIONS FINALES
            ===================================== */}


            <div className="result-actions">


                <button

                className="retry-button"

                onClick={()=>navigate("/test")}

                >

                    Refaire le test

                </button>




                <button

                className="home-button"

                onClick={()=>navigate("/")}

                >

                    🏠 Retour à l'accueil

                </button>



            </div>




        </div>

    );

}



export default Result;