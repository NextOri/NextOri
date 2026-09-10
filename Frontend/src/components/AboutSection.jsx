import "../styles/AboutSection.css";

function AboutSection() {

    return (

        <section className="about-section">

            <div className="about-container">

                <div className="about-content">

                    <span className="about-label">
                        � PROPOS DE NEXTORI
                    </span>

                    <h2>
                        Une orientation pens�e pour construire
                        <span> ton avenir.</span>
                    </h2>

                    <p>
                        NextOri est une plateforme d'accompagnement
                        � l'orientation qui aide les �tudiants et les
                        futurs �tudiants � mieux construire leur avenir
                        acad�mique et professionnel.
                    </p>

                    <p>
                        Gr�ce � l'analyse de tes centres d'int�r�t,
                        de tes forces et de tes attentes, NextOri
                        t'aide � mieux comprendre les possibilit�s
                        qui s'offrent � toi.
                    </p>

                    <p>
                        D�couvre des m�tiers, explore les fili�res
                        correspondantes et recherche les �tablissements
                        qui peuvent accompagner ton parcours.
                    </p>

                </div>


                <div className="about-highlight">

                    <div className="about-highlight-number">
                        ?
                    </div>

                    <h3>
                        Ton orientation,
                        �tape par �tape.
                    </h3>

                    <p>
                        Comprendre ton profil, explorer les possibilit�s
                        et avancer vers un choix qui te ressemble.
                    </p>

                </div>

            </div>

        </section>

    );

}

export default AboutSection;