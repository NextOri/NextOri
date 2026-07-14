import "../styles/Footer.css";


function Footer(){

    return(

        <footer className="footer">


            <div className="footer-content">


                <h2>
                    NextOri
                </h2>


                <p>
                    Une plateforme intelligente pour accompagner
                    les jeunes dans leurs choix d'orientation.
                </p>


                <div className="footer-links">

                    <a href="/">
                        Accueil
                    </a>

                    <a href="/test">
                        Test
                    </a>

                    <a href="/resultat">
                        Résultats
                    </a>

                </div>


                <p className="copyright">

                    © 2026 NextOri - Tous droits réservés

                </p>


            </div>


        </footer>

    );

}


export default Footer;