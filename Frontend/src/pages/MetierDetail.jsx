import { useNavigate } from "react-router-dom";

import "../styles/MetierDetail.css";


function MetierDetail(){


    const navigate = useNavigate();



    // Données temporaires pour préparer le design
    // Elles seront remplacées par les données venant de l'API

    const metier = {

        nom: "Data Analyst",

        secteur: "Informatique et Data",

        profil_riasec: "Investigateur - Conventionnel",

        niveau_etude: "Licence / Master",

        salaire_min: "300 000 FCFA",

        salaire_max: "800 000 FCFA",

        description:
        "Le Data Analyst collecte, nettoie et analyse les données afin d'aider les organisations à prendre de meilleures décisions. Il transforme les données en informations utiles pour orienter les stratégies."
    };




    return (


        <div className="metier-page">


            <header className="metier-header">


                <h1>
                    {metier.nom}
                </h1>


                <p>
                    Découvrez les informations sur ce métier.
                </p>


            </header>





            <section className="metier-main-card">


                <div className="metier-tag">

                    {metier.secteur}

                </div>



                <h2>
                    À propos du métier
                </h2>



                <p className="metier-description">

                    {metier.description}

                </p>



            </section>






            <section className="metier-infos">


                <div className="info-card">


                    <h3>
                        🎓 Niveau d'étude
                    </h3>


                    <p>
                        {metier.niveau_etude}
                    </p>


                </div>





                <div className="info-card">


                    <h3>
                        🧩 Profil RIASEC
                    </h3>


                    <p>
                        {metier.profil_riasec}
                    </p>


                </div>






                <div className="info-card">


                    <h3>
                        💼 Secteur
                    </h3>


                    <p>
                        {metier.secteur}
                    </p>


                </div>






                <div className="info-card">


                    <h3>
                        💰 Salaire estimé
                    </h3>


                    <p>

                        {metier.salaire_min}
                        {" - "}
                        {metier.salaire_max}

                    </p>


                </div>



            </section>







            <div className="metier-action">


                <button

                className="formation-button"

                onClick={()=>navigate("/formations")}

                >

                    Voir les formations

                </button>


            </div>



        </div>


    );

}



export default MetierDetail;