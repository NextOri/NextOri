import { useNavigate } from "react-router-dom";

import "../styles/Formations.css";


function Formations(){


    const navigate = useNavigate();



    // Données temporaires
    // Elles seront remplacées plus tard par l'API

    const formations = [

        {

            id_filiere:1,

            nom:"Licence Informatique",

            description:
            "Cette formation permet d'acquérir des compétences en programmation, bases de données, systèmes et analyse des données.",

            domaine:"Informatique",

            duree:"3 ans"

        },


        {

            id_filiere:2,

            nom:"Master Data Science",

            description:
            "Cette formation prépare aux métiers de la science des données, de l'intelligence artificielle et de l'analyse avancée.",

            domaine:"Data et Intelligence Artificielle",

            duree:"2 ans"

        }


    ];





    return (


        <div className="formations-page">



            <header className="formations-header">


                <h1>
                    Formations associées
                </h1>


                <p>
                    Découvrez les formations qui peuvent vous mener vers ce métier.
                </p>


            </header>







            <section className="formations-list">



                {

                formations.map((formation)=>(


                    <article

                    className="formation-card"

                    key={formation.id_filiere}

                    >



                        <h2>

                            {formation.nom}

                        </h2>





                        <div className="formation-info">


                            <p>

                                <strong>
                                    Domaine :
                                </strong>

                                {" "}

                                {formation.domaine}

                            </p>



                            <p>

                                <strong>
                                    Durée :
                                </strong>

                                {" "}

                                {formation.duree}

                            </p>



                        </div>






                        <p className="formation-description">

                            {formation.description}

                        </p>







                        <button

                        className="university-button"

                        onClick={()=>navigate("/universites")}

                        >

                            Voir les universités

                        </button>





                    </article>


                ))

                }



            </section>




        </div>


    );

}



export default Formations;