import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import FooterNavigation from "../components/FooterNavigation";
import "../styles/FiliereDetail.css";

function FiliereDetail() {

    const { id_filiere } = useParams();

    const navigate = useNavigate();

    const [filiere, setFiliere] = useState(null);

    const [loading, setLoading] = useState(true);

    const [metiers, setMetiers] = useState([]);

    useEffect(() => {

        fetch(
            `http://localhost/nextori/backend/api/routes/filiere_details.php?id_filiere=${id_filiere}`
        )

        .then(response => response.json())

        .then(data => {

            if(data.success){

                setFiliere(data.data);
                setMetiers(data.metiers);

            }

            setLoading(false);

        })

        .catch(error => {

            console.error(
                "Erreur récupération filière :",
                error
            );

            setLoading(false);

        });

    }, [id_filiere]);


    if(loading){

        return(

            <div className="loading-container">

                <div className="loading-spinner"></div>

                <p>Chargement de la filière...</p>

            </div>

        );

    }


    if(!filiere){

        return(

            <div className="filiere-introuvable">

                <h2>🎓 Filière introuvable</h2>

                <p>

                    Cette filière n'existe pas ou n'est plus disponible.

                </p>

                <button
                    className="retour-btn"
                    onClick={()=>navigate("/filieres")}
                >

                    ← Retour aux filières

                </button>

            </div>

        );

    }


    return(

        <div className="filiere-detail-page">


            <div className="filiere-detail-header">

                <h1>{filiere.nom}</h1>

                <div className="header-infos">

                    <span>

                        📂 {filiere.domaine}

                    </span>

                    <span>

                        ⏳ {filiere.duree}

                    </span>

                </div>

            </div>



            <section className="detail-section">

                <h2>Présentation</h2>

                <p>

                    {filiere.presentation}

                </p>

            </section>



            <section className="detail-section">

                <h2>Compétences développées</h2>

                <div className="competences-container">

                    {
                        filiere.competences_developpees
                        .split(",")

                        .map((competence,index)=>(

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

            <section className="detail-section">

       <h2>🎯 Métiers accessibles après cette filière</h2>

       <div className="filiere-metiers-container">

        {
            metiers.map((metier) => (

                <div
                    key={metier.id_metier}
                    className="filiere-metier-card"
                >

                    💼 {metier.nom}

                </div>

            ))
        }

     </div>

     </section>



            <button
                className="retour-btn"
                onClick={()=>navigate("/filieres")}
            >

                ← Retour aux filières

            </button>


            

            <FooterNavigation/>

        </div>

    );

}

export default FiliereDetail;