import { useLocation, useNavigate } from "react-router-dom";

import "../styles/Profil-Riasec.css";

import profilsRiasec from "../data/profilsRiasec";

import {
    FaStar,
    FaBrain,
    FaBuilding,
    FaHome,
    FaArrowLeft
} from "react-icons/fa";



function ProfilRiasec(){


    const location = useLocation();

    const navigate = useNavigate();



    const resultat = location.state?.resultat;



    /*
        Si aucun résultat n'est disponible
    */

    if(!resultat){

        return(

            <div className="profil-empty">


                <h1>
                    Aucun profil disponible
                </h1>


                <p>
                    Vous devez effectuer le test RIASEC
                    avant de consulter votre profil.
                </p>



                <button

                onClick={()=>navigate("/test")}

                >

                    Faire le test

                </button>


            </div>

        );

    }




    const codeProfil = resultat.profil.principal;



    const profil = profilsRiasec[codeProfil];



    /*
        Sécurité si le profil n'existe pas
    */

    if(!profil){

        return(

            <div className="profil-empty">

                <h1>
                    Profil introuvable
                </h1>


                <p>
                    Une erreur est survenue lors du chargement
                    de votre profil RIASEC.
                </p>

            </div>

        );

    }



    return(

        <div className="profil-page">



            <header className="profil-header">


                <h1>
                    Votre profil RIASEC
                </h1>


                <p>
                    Découvrez votre personnalité professionnelle.
                </p>


            </header>
            <section className="profil-card">



                <div className="profil-code">

                    {codeProfil}

                </div>




                <h2>

                    {profil.nom}

                </h2>




                <p className="profil-description">

                    {profil.description}

                </p>



            </section>







            <section className="profil-section">



                    <h2 className="section-title">

                        <FaStar className="section-icon forces-icon" />

                            Vos points forts

                                </h2>



                <div className="profil-list">


                    {
                        profil.forces.map(
                            (force,index)=>(

                                <div

                                key={index}

                                className="profil-item"

                                >

                                    {force}

                                </div>

                            )
                        )
                    }


                </div>



            </section>
            <section className="profil-section">



               <h2 className="section-title">

               <FaBrain className="section-icon competences-icon" />

                Vos compétences naturelles

                </h2>



                <div className="profil-list">


                    {
                        profil.competences.map(
                            (competence,index)=>(

                                <div

                                key={index}

                                className="profil-item"

                                >

                                    {competence}

                                </div>

                            )
                        )
                    }


                </div>



            </section>









            <section className="profil-section">



                <h2 className="section-title">

                   <FaBuilding className="section-icon environnements-icon" />
 
                  Environnements professionnels adaptés

               </h2>



                <div className="profil-list">


                    {
                        profil.environnements.map(
                            (environnement,index)=>(

                                <div

                                key={index}

                                className="profil-item"

                                >

                                    {environnement}

                                </div>

                            )
                        )
                    }


                </div>



            </section>








            <div className="profil-actions">


    <button

    className="back-result-button"

    onClick={()=>navigate("/result",{

        state: {
            data: resultat
        }

    })}

    >

        ← Retour aux résultats

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



export default ProfilRiasec;