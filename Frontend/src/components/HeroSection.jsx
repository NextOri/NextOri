import { useNavigate } from "react-router-dom";

import "../styles/HeroSection.css";


function HeroSection(){

    const navigate = useNavigate();


    return(

        <section className="hero">


            <div className="hero-text">


                <h1>

                    Trouve la voie qui correspond à ton potentiel.

                </h1>


                <p>

                    NextOri t'accompagne dans ton orientation grâce au profil RIASEC.
                    Découvre les métiers, les filières et les universités adaptés à ton avenir.

                </p>


                <div className="hero-buttons">


                    <button

                        className="btn-primary"

                        onClick={()=>navigate("/test")}

                    >

                        Commencer le test

                    </button>



                    <button 
                    className="btn-secondary"
                     onClick={() => navigate("/dashboard")}
                         >
                     Explorer la plateforme
                        </button>


                </div>


            </div>



            <div className="hero-image">


                <div className="image-placeholder">

                    Illustration NextOri

                </div>


            </div>


        </section>


    );

}


export default HeroSection;