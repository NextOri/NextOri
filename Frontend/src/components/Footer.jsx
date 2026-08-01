import React from "react";
import { Link } from "react-router-dom";
import "../styles/Footer.css";

import {
    FaInstagram,
    FaLinkedin,
    FaFacebook,
    FaWhatsapp
} from "react-icons/fa";


function Footer() {


    return (

        <footer className="site-footer">


            <div className="site-footer-container">


                <div className="site-footer-brand">

                    <h2>
                        NextOri
                    </h2>


                    <p>
                        Votre plateforme d'accompagnement
                        à l'orientation académique et
                        professionnelle.
                    </p>

                </div>




               <div className="site-footer-links">

    <h3>
        Navigation
    </h3>

   <div className="site-footer-link-list">

   <Link to="/">Accueil</Link>

<span className="footer-separator">•</span>

<Link to="/test">Test RIASEC</Link>

<span className="footer-separator">•</span>

<Link to="/metiers">Métiers</Link>

<span className="footer-separator">•</span>

<Link to="/filieres">Formations</Link>

<span className="footer-separator">•</span>

<Link to="/universite-catalogue">Universités</Link>
</div>

</div>


                <div className="site-footer-social">


                    <h3>
                        Suivez-nous
                    </h3>



                    <div>


                        <a href="#">
                            <FaInstagram />
                        </a>


                        <a href="#">
                            <FaLinkedin />
                        </a>


                        <a href="#">
                            <FaFacebook />
                        </a>


                        <a href="#">
                            <FaWhatsapp />
                        </a>


                    </div>


                </div>



            </div>





            <div className="site-footer-bottom">

                <p>
                    © 2026 NextOri - Tous droits réservés
                </p>

            </div>



        </footer>

    );

}


export default Footer;