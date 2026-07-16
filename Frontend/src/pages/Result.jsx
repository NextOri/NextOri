import { useLocation, useNavigate } from "react-router-dom";

import "../styles/Result.css";


function Result(){

    const location = useLocation();

    const navigate = useNavigate();


    const resultat = location.state;



    if(!resultat){

    return (

        <div className="result-empty">


            <h1>
                Aucun résultat disponible
            </h1>


            <p>
                Vous n'avez pas encore effectué votre test d'orientation.
                Faites le test pour découvrir votre profil et les métiers qui vous correspondent.
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



    return (

        <div className="result-page">


            <header className="result-header">

                <h1>
                    Votre résultat NextOri
                </h1>

                <p>
                    Découvrez les métiers qui correspondent à votre profil.
                </p>

            </header>




            <section className="profile-result">


                <h2>
                    Votre profil RIASEC
                </h2>


                <div className="profile-code">

                    IS

                </div>


                <h3>
                    Investigateur - Social
                </h3>


                <p>
                    Votre profil montre un intérêt pour l'analyse,
                    la réflexion et l'accompagnement des autres.
                </p>


                <button className="profile-button">

                    Détail du profil

                </button>


            </section>





            <section className="jobs-section">


                <h2>
                    Métiers recommandés
                </h2>



                <div className="jobs-list">


                    <article className="job-card">


                        <div className="job-header">

                            <h3>
                                Data Analyst
                            </h3>


                            <span>
                                92% compatible
                            </span>


                        </div>



                        <p>

                            Le Data Analyst collecte, analyse et interprète
                            les données afin d'aider les organisations
                            à prendre de meilleures décisions.

                        </p>



                        <h4>
                            Compétences principales
                        </h4>


                        <ul>

                            <li>Analyse de données</li>

                            <li>Statistiques</li>

                            <li>Programmation</li>

                        </ul>



                        <button className="job-button">

                            Voir les informations

                        </button>


                    </article>






                    <article className="job-card">


                        <div className="job-header">

                            <h3>
                                Ingénieur informatique
                            </h3>


                            <span>
                                87% compatible
                            </span>


                        </div>



                        <p>

                            L'ingénieur informatique conçoit,
                            développe et maintient des solutions
                            technologiques.

                        </p>



                        <h4>
                            Compétences principales
                        </h4>


                        <ul>

                            <li>Développement logiciel</li>

                            <li>Architecture système</li>

                            <li>Résolution de problèmes</li>

                        </ul>



                        <button className="job-button">

                            Voir les informations

                        </button>


                    </article>


                </div>


            </section>






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

                    Retour à l'accueil

                </button>


            </div>


        </div>

    );

}


export default Result;