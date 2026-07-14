import FeatureCard from "./FeatureCard";

import "../styles/FeaturesSection.css";


function FeaturesSection(){


    return(


        <section className="features-section">


            <h2>

                Pourquoi choisir NextOri ?

            </h2>



            <div className="features-container">


                <FeatureCard

                    icone="🧭"

                    titre="Orientation personnalisée"

                    description="Analyse ton profil RIASEC et découvre les métiers adaptés à ta personnalité."

                />



                <FeatureCard

                    icone="🎓"

                    titre="Filières adaptées"

                    description="Découvre les formations nécessaires pour atteindre tes objectifs."

                />



                <FeatureCard

                    icone="🏫"

                    titre="Universités"

                    description="Trouve les établissements qui proposent les formations recommandées."

                />


            </div>


        </section>


    );


}


export default FeaturesSection;