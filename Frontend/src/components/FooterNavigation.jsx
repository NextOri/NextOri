import { NavLink, useNavigate } from "react-router-dom";
import "../styles/FooterNavigation.css";
import React from "react";




function FooterNavigation() {

    const navigate = useNavigate();

    const handleProfileClick = () => {

    const utilisateur = localStorage.getItem("utilisateur");


    if (utilisateur) {

        navigate("/profil");

    } else {

        navigate("/connexion");

    }

     };

    return (

        <footer className="footer-navigation">


            <NavLink to="/dashboard">

                <span>🏠</span>

                <p>
                    Accueil
                </p>

            </NavLink>



            <NavLink to="/test">

                <span>🧪</span>

                <p>
                    Test
                </p>

            </NavLink>



            <NavLink to="/metiers">

                <span>💼</span>

                <p>
                    Métiers
                </p>

            </NavLink>



            <NavLink to="/filieres">

                <span>🎓</span>

                <p>
                    Formations
                </p>

            </NavLink>



            <NavLink to="/universite-catalogue">

                <span>🏛</span>

                <p>
                    Universités
                </p>

            </NavLink>



            <NavLink 
    to="/profil"
    onClick={handleProfileClick}
                   >
    <span>👤</span>

    <p>Profil</p>

       </NavLink>


        </footer>

    );

}


export default FooterNavigation;