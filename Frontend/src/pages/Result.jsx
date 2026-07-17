import { useLocation, useNavigate } from "react-router-dom";

import "../styles/Result.css";


function Result(){

    const location = useLocation();

    const navigate = useNavigate();


    /*
        Récupération des données envoyées par le backend

        Backend :
        {
            success:true,
            message:"",
            data:{
                id_test,
                profil,
                recommandations
            }
        }

    */

    const resultat = location.state?.data;



    /*
        Si l'utilisateur arrive directement
        sur /result sans avoir passé le test
    */

    if(!resultat){

        return (

            <div className="result-empty">


                <h1>
                    Aucun résultat disponible
                </h1>


                <p>
                    Vous n'avez pas encore effectué votre test
                    d'orientation.

                    Faites le test pour découvrir votre profil
                    RIASEC et les métiers qui vous correspondent.
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



    /*
        Données du profil
    */

    const profil = resultat.profil;



    const scores = profil.scores;



    /*
        Recommandations métiers

        Le backend sépare déjà :
        - principaux
        - secondaires
    */

    const recommandations =
        resultat.recommandations || {};



    const metiersPrincipaux =
        recommandations.principaux || [];



    const metiersSecondaires =
        recommandations.secondaires || [];




    /*
        Fonction pour afficher
        le salaire proprement
    */

    function afficherSalaire(min, max){


        if(!min && !max){

            return "Information non disponible";

        }


        return `${min?.toLocaleString()} FCFA - ${max?.toLocaleString()} FCFA`;

    }





    /*
        Fonction temporaire pour la compatibilité

        On modifiera avec ton vrai algorithme
        après vérification du calcul backend.

    */

    function afficherCompatibilite(score){


        if(score === undefined){

            return "Compatibilité disponible";

        }


        return `${score}%`;

    }






    return (

        <div className="result-page">


            <header className="result-header">


                <h1>
                    Votre résultat NextOri
                </h1>


                <p>
                    Découvrez votre profil et les métiers
                    qui correspondent à vos intérêts.
                </p>


            </header>
            {/* ===========================
    PROFIL RIASEC
=========================== */}

<section className="profile-result">

    <h2>
        Votre profil RIASEC
    </h2>


    <div className="profile-code">

        {profil.principal}

    </div>


    <h3>

        Profil complet : {profil.complet}

    </h3>


    <p>

        Ce profil représente les domaines
        qui correspondent le mieux à vos
        intérêts professionnels.

        Les métiers proposés ci-dessous
        sont calculés automatiquement
        à partir de votre résultat.

    </p>


    <button

        className="profile-button"

        onClick={()=>

            navigate(

                "/profil",

                {

                    state: profil

                }

            )

        }

    >

        Détails du profil

    </button>


</section>




{/* ===========================
    SCORES RIASEC
=========================== */}

<section className="scores-section">

    <h2>

        Vos scores

    </h2>


    {

        Object.entries(scores).map(

            ([lettre,valeur])=>(


                <div

                    key={lettre}

                    className="score-item"

                >


                    <div className="score-header">


                        <span>

                            {lettre}

                        </span>


                        <span>

                            {valeur}

                        </span>


                    </div>



                    <div className="score-bar">


                        <div

                            className="score-fill"

                            style={{

                                width:`${(valeur/8)*100}%`

                            }}

                        >

                        </div>


                    </div>


                </div>

            )

        )

    }


</section>
{/* =====================================================
    RECOMMANDATIONS PRINCIPALES
===================================================== */}

<section className="jobs-section">

    <h2>

        ⭐ Recommandations principales

    </h2>


    <div className="jobs-list">

        {

            metiersPrincipaux.length === 0 ?

            (

                <p className="empty-job">

                    Aucun métier principal trouvé.

                </p>

            )

            :

            (

                metiersPrincipaux.map((metier)=>(

                    <article

                        key={metier.id_metier}

                        className="job-card"

                    >


                        <div className="job-header">

                            <h3>

                                {metier.nom}

                            </h3>


                            <span className="compatibilite">

                                {afficherCompatibilite(
                                    metier.score_compatibilite
                                )}

                            </span>


                        </div>



                        <div className="job-details">


                            <div>

                                <strong>

                                    Secteur

                                </strong>

                                <p>

                                    {metier.secteur}

                                </p>

                            </div>



                            <div>

                                <strong>

                                    Niveau d'étude

                                </strong>

                                <p>

                                    {metier.niveau_etude}

                                </p>

                            </div>



                            <div>

                                <strong>

                                    Salaire

                                </strong>

                                <p>

                                    {afficherSalaire(

                                        metier.salaire_min,

                                        metier.salaire_max

                                    )}

                                </p>

                            </div>


                        </div>




                        <div className="job-description">

                            <h4>

                                Description

                            </h4>


                            <p>

                                {metier.description}

                            </p>

                        </div>





                        <button

                            className="job-button"

                            onClick={()=>

                                navigate(

                                    "/formations",

                                    {

                                        state: metier

                                    }

                                )

                            }

                        >

                            Explorer cette carrière

                        </button>


                    </article>

                ))

            )

        }

    </div>

</section>





{/* =====================================================
    RECOMMANDATIONS SECONDAIRES
===================================================== */}

<section className="jobs-section secondary">

    <h2>

        🌟 Autres métiers compatibles

    </h2>


    <div className="jobs-list">

        {

            metiersSecondaires.length === 0 ?

            (

                <p className="empty-job">

                    Aucun métier secondaire trouvé.

                </p>

            )

            :

            (

                metiersSecondaires.map((metier)=>(

                    <article

                        key={metier.id_metier}

                        className="job-card"

                    >


                        <div className="job-header">

                            <h3>

                                {metier.nom}

                            </h3>


                            <span className="compatibilite">

                                {afficherCompatibilite(

                                    metier.score_compatibilite

                                )}

                            </span>


                        </div>




                        <div className="job-details">


                            <div>

                                <strong>

                                    Secteur

                                </strong>

                                <p>

                                    {metier.secteur}

                                </p>

                            </div>




                            <div>

                                <strong>

                                    Niveau d'étude

                                </strong>

                                <p>

                                    {metier.niveau_etude}

                                </p>

                            </div>




                            <div>

                                <strong>

                                    Salaire

                                </strong>

                                <p>

                                    {afficherSalaire(

                                        metier.salaire_min,

                                        metier.salaire_max

                                    )}

                                </p>

                            </div>


                        </div>





                        <div className="job-description">

                            <h4>

                                Description

                            </h4>


                            <p>

                                {metier.description}

                            </p>

                        </div>





                        <button

                            className="job-button"

                            onClick={()=>

                                navigate(

                                    "/formations",

                                    {

                                        state: metier

                                    }

                                )

                            }

                        >

                            Explorer cette carrière

                        </button>


                    </article>

                ))

            )

        }

    </div>

</section>
{/* =====================================================
    ACTIONS
===================================================== */}

<div className="result-actions">

    <button

        className="retry-button"

        onClick={() => navigate("/test")}

    >

        Refaire le test

    </button>



    <button

        className="home-button"

        onClick={() => navigate("/")}

    >

        Retour à l'accueil

    </button>


</div>





{/* =====================================================
    FIN DE LA PAGE
===================================================== */}

</div>

);

}

export default Result;