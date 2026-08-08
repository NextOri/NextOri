import { NavLink, useNavigate } from "react-router-dom";
import "../styles/FooterNavigation.css";
import React from "react";
import {
    FaHome,
    FaClipboardList,
    FaBriefcase,
    FaGraduationCap,
    FaUniversity,
    FaUser
} from "react-icons/fa";




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

                <span>
                    <FaHome />
                </span>

                <p>
                    Accueil
                </p>

            </NavLink>



            <NavLink to="/test">

                <span>
                    <FaClipboardList />
                </span>

                <p>
                    Test
                </p>

            </NavLink>



            <NavLink to="/metiers">

                <span>
                    <FaBriefcase />
                </span>

                <p>
                    Métiers
                </p>

            </NavLink>



            <NavLink to="/filieres">

                <span>
                    <FaGraduationCap />
                </span>

                <p>
                    Formations
                </p>

            </NavLink>



            <NavLink to="/universite-catalogue">

                <span>
                    <FaUniversity />
                </span>

                <p>
                    Universités
                </p>

            </NavLink>



            <NavLink 
    to="/profil"
    onClick={handleProfileClick}
                   >
    <span>
        <FaUser />
    </span>

    <p>Profil</p>

       </NavLink>


        </footer>

    );

}


export default FooterNavigation;