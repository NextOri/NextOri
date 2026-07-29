import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import "../styles/MetierDetail.css";
import FooterNavigation from "../components/FooterNavigation";


function MetierDetail() {


    const { id_metier } = useParams();

    const navigate = useNavigate();


    const [metier, setMetier] = useState(null);

    const [loading, setLoading] = useState(true);



    useEffect(() => {


        fetch(
            `http://localhost/nextori/backend/api/routes/metiers_details.php?id_metier=${id_metier}`
        )

        .then((response) => response.json())

        .then((data) => {


            if(data.success){

                setMetier(data.data);

            }


            setLoading(false);


        })

        .catch((error) => {


            console.error(
                "Erreur récupération détail métier :",
                error
            );


            setLoading(false);


        });



    }, [id_metier]);




    if (loading) {

    return (

        <div className="loading-container">

            <div className="loading-spinner"></div>

            <p>Chargement du métier...</p>

        </div>

     );

    }



    if(!metier){

    return(

        <div className="metier-introuvable">

            <h2>😕 Métier introuvable</h2>

            <p>

                Le métier demandé n'existe pas ou n'est plus disponible.

            </p>

            <button
                className="retour-btn"
                onClick={()=>navigate("/metiers")}
            >

                ← Retour aux métiers

            </button>

        </div>

     );

    }



    return (

        <div className="metier-detail-page">


            {/* En-tête */}

            <div className="metier-detail-header">


                <h1>{metier.nom}</h1>


                <div className="metier-tendance">

                    📈 {metier.tendance}

                </div>


                <p>{metier.secteur}</p>


            </div>




            {/* Présentation */}

            <section className="detail-section">


                <h2>Présentation du métier</h2>


                <p>
                    {metier.presentation}
                </p>


            </section>





            {/* Compétences */}

            <section className="detail-section">


                <h2>Compétences nécessaires</h2>


                <div className="competences-container">

         {
        metier.competences
        .split(",")
        .map((competence, index) => (

            <span
                key={index}
                className="competence-badge"
            >
                {competence.trim()}
            </span>

        ))
       }

        </div>


            </section>





            {/* Informations */}

            <section className="detail-section">


                <h2>Informations</h2>


                <div className="infos-grid">


                    <div>
                        🎓 Niveau d'étude
                        <strong>
                            {metier.niveau_etude}
                        </strong>
                    </div>



                    <div>
                        💰 Salaire minimum
                        <strong>
                            {metier.salaire_min} FCFA
                        </strong>
                    </div>



                    <div>
                        💰 Salaire maximum
                        <strong>
                            {metier.salaire_max} FCFA
                        </strong>
                    </div>


                </div>


            </section>





            {/* Filières */}

            <section className="detail-section">


                <h2>Filières liées</h2>



                <div className="filieres-container">


                    {
                        metier.filieres.map((filiere)=>(
                            
                            <div 
                                key={filiere.id_filiere}
                                className="filiere-card"
                            >

                                🎓 {filiere.nom}

                            </div>

                        ))
                    }


                </div>


            </section>





            <button
                className="retour-btn"
                onClick={()=>navigate("/metiers")}
            >

                ← Retour aux métiers

            </button>

            <div className="footer-spacing"></div>

              <FooterNavigation />



        </div>

    );

}



export default MetierDetail;