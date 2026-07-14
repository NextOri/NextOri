import { Link } from "react-router-dom";

import "../styles/Navbar.css";


function Navbar(){

    return(

        <nav className="navbar">

            <div className="logo">

                NextOri

            </div>


            <div className="nav-links">

                <Link to="/">
                    Accueil
                </Link>

                <Link to="/test">
                    Test
                </Link>

                <Link to="/resultat">
                    Résultats
                </Link>

            </div>


        </nav>

    );

}


export default Navbar;