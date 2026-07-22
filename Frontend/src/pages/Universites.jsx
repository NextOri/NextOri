import { useEffect, useState } from "react";

import { useLocation, useNavigate } from "react-router-dom";

import {

    FaArrowLeft,

    FaUniversity,

    FaGlobe,

    FaMapMarkerAlt

} from "react-icons/fa";

import { MdLocationCity } from "react-icons/md";

import "../styles/Universites.css";



function Universites(){


    const navigate = useNavigate();

    const location = useLocation();



    /*
        Données reçues depuis Formations.jsx
    */

    const filiere = location.state?.filiere;

    const metier = location.state?.metier;

    const resultat = location.state?.resultat;



    const nomFiliere = filiere?.nom || "cette formation";



    /*
        Etats
    */

    const [universites,setUniversites] = useState([]);

    const [chargement,setChargement] = useState(true);

    const [erreur,setErreur] = useState(null);



    /*
        Vérification de sécurité
    */

    if(!filiere){

        return(

            <div className="universites-empty">

                <h1>

                    Aucune formation sélectionnée

                </h1>

                <p>

                    Veuillez d'abord choisir une formation.

                </p>

            </div>

        );

    }
    
        /*
        Chargement des universités
    */

    useEffect(()=>{


        const chargerUniversites = async()=>{


            try{


                const reponse = await fetch(

                    `http://localhost/NextOri/backend/api/routes/universites.php?id_filiere=${filiere.id_filiere}`

                );


                const data = await reponse.json();


                console.log("Universités reçues :",data);


                if(data.success){

                    setUniversites(data.universites);

                }

                else{

                    setErreur(data.message);

                }


            }

            catch(error){

                console.error(error);

                setErreur("Erreur lors du chargement des universités.");

            }

            finally{

                setChargement(false);

            }

        };


        chargerUniversites();


    },[filiere]);

        /*
        Chargement
    */

    if(chargement){

        return(

            <div className="universites-loading">

                Chargement des universités...

            </div>

        );

    }



    /*
        Gestion des erreurs
    */

    if(erreur){

        return(

            <div className="universites-error">

                <h2>

                    {erreur}

                </h2>

            </div>

        );

    }



    return(

        <div className="universites-page">



           




            <header className="universites-header">



                <h1>

                    🏫 Universités proposant la filière

                    <span className="filiere-title">

                        {" "}

                        {nomFiliere}

                    </span>

                </h1>



                <p>

                    Découvrez les établissements qui proposent cette formation.

                </p>



            </header>



            <section className="universites-list">

                                {

                    universites.map((universite)=>(

                        <article

                        className="universite-card"

                        key={universite.id_universite}

                        >



                            <h2>

                                <FaUniversity className="university-title-icon"/>

                                {" "}

                                {universite.nom}

                            </h2>




                            <div className="universite-info">



                                <p>

                                    <FaMapMarkerAlt className="universite-icon ville-icon"/>

                                    <strong>

                                        Ville :

                                    </strong>

                                    {" "}

                                    {universite.ville}

                                </p>




                                <p>

                                    <MdLocationCity className="universite-icon pays-icon"/>

                                    <strong>

                                        Pays :

                                    </strong>

                                    {" "}

                                    {universite.pays}

                                </p>




                                <p>

                                    <FaUniversity className="universite-icon type-icon"/>

                                    <strong>

                                        Type :

                                    </strong>

                                    {" "}

                                    {universite.type}

                                </p>



                            </div>




                            <p className="universite-description">

                                {universite.description}

                            </p>




                            <a

                                href={universite.site_web}

                                target="_blank"

                                rel="noopener noreferrer"

                                className="site-button"

                            >

                                <FaGlobe />

                                {" "}

                                Visiter le site web

                            </a>



                        </article>

                    ))

                }

            </section>
                 

                  <div className="universites-actions">



                <button

                className="back-formation-button"

                onClick={()=>navigate("/formations",{

                    state:{

                        filiere,

                        metier,

                        resultat

                    }

                })}

                >

                    <FaArrowLeft />

                    {" "}

                    Retour aux formations

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

export default Universites;