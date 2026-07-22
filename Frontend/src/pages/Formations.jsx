import { useEffect, useState } from "react";

import { useLocation, useNavigate } from "react-router-dom";

import "../styles/Formations.css";

import {

    FaGraduationCap,

    FaClock,

    FaArrowLeft

} from "react-icons/fa";

import {

    MdCategory

} from "react-icons/md";


function Formations(){


    const navigate = useNavigate();


    const location = useLocation();



    /*
        Métier reçu depuis Result.jsx
    */

    const metier = location.state?.metier;

    const resultat = location.state?.resultat;

    const nomMetier = metier?.nom || "ce métier";

    


    /*
        Etats
    */

    const [formations,setFormations] = useState([]);


    const [chargement,setChargement] = useState(true);


    const [erreur,setErreur] = useState("");




    /*
        Récupération des filières
        depuis le backend
    */

    useEffect(()=>{
        console.log("useEffect Formations executee");
        console.log("Metier dans useEffect :", metier);


        const chargerFormations = async()=>{


            try{


                if(!metier){

                    setErreur(
                        "Aucun métier sélectionné."
                    );


                    setChargement(false);


                    return;

                }

     console.log(
    "URL appelée :",
    `http://localhost/NextOri/backend/api/routes/filieres.php?id_metier=${metier.id_metier}`
);

                const reponse = await fetch(

                    `http://localhost/NextOri/backend/api/routes/filieres.php?id_metier=${metier.id_metier}`

                );
                 console.log("Reponse HTTP :", reponse);



                const data = await reponse.json();
                console.log("Reponse backend :", data);



                if(data.success){


                    setFormations(data.formations);


                }
                else{


                    setErreur(data.message);


                }



            }
            catch(error){
            console.log("Erreur fetch :", error);

                setErreur(
                    "Erreur lors du chargement des formations."
                );


            }
            finally{


                setChargement(false);


            }


        };



        chargerFormations();



    },[metier]);

    return(


        <div className="formations-page">



     <header className="formations-header">

      <h1>

           🎯 Parcours de formation pour devenir

            <span className="metier-title">

             {" "}{nomMetier}

            </span>

       </h1>

       <p>

        Découvrez les formations recommandées pour accéder à ce métier,
        puis explorez les universités qui les proposent.

      </p>

          </header>





            <section className="formations-list">


                {
                    chargement && (

                        <p className="formations-message">

                            Chargement des formations...

                        </p>

                    )
                }




                {
                    erreur && (

                        <p className="formations-message error">

                            {erreur}

                        </p>

                    )
                }




                {
                    !chargement && !erreur && formations.length === 0 && (

                        <p className="formations-message">

                            Aucune formation trouvée pour ce métier.

                        </p>

                    )
                }





                {

                formations.map((formation)=>(


                    <article

                    className="formation-card"

                    key={formation.id_filiere}

                    >



                        <h2>

                            🎓 {formation.nom}

                        </h2>





                        <div className="formation-info">



                            <p>

               <MdCategory className="formation-icon domaine-icon"/>

                                <strong>

                        Domaine :

                            </strong>

                     {" "}

                      {formation.domaine}

                        </p>




                                 <p>

                        <FaClock className="formation-icon duree-icon"/>

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

                        onClick={()=>navigate("/universites",{

                            state:{

                                filiere: formation,

                                metier,

                                resultat

                            }

                        })}

                        >

                            Voir les universités

                        </button>





                    </article>


                ))

                }
                </section>


             <div className="formations-actions">

    <button

        className="back-result-button"

        onClick={() =>
            navigate("/result", {
                state: {
                    data: location.state?.resultat
                }
            })
        }

    >

        <FaArrowLeft />

            {" "}

             Retour aux résultats

            </button>

               </div>

        </div>


    );


}



export default Formations;