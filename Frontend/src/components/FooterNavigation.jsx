import { NavLink } from "react-router-dom";
import "../styles/FooterNavigation.css";


function FooterNavigation() {

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



            <NavLink to="/universites-catalogue">

                <span>🏛</span>

                <p>
                    Universités
                </p>

            </NavLink>



            <NavLink to="/profil">

                <span>👤</span>

                <p>
                    Profil
                </p>

            </NavLink>


        </footer>

    );

}


export default FooterNavigation;