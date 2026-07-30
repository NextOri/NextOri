import { useState } from "react";
import { useNavigate } from "react-router-dom";


function Profil() {

    const navigate = useNavigate();

    const [utilisateur, setUtilisateur] = useState(() => {

        const user = localStorage.getItem("utilisateur");

        return user ? JSON.parse(user) : null;

    });



    const handleLogout = () => {

        localStorage.removeItem("utilisateur");

        setUtilisateur(null);

    };



   if (!utilisateur) {

    return (

        <div>

            <h1>
                Profil
            </h1>


            <p>
                Vous devez être connecté pour accéder à votre profil.
            </p>


            <button
                onClick={() => navigate("/connexion")}
            >
                Se connecter
            </button>


        </div>

    );

}



    return (

        <div>

            <h1>
                Mon Profil
            </h1>


            <div>

                <p>
                    <strong>Nom :</strong> {utilisateur.nom}
                </p>


                <p>
                    <strong>Email :</strong> {utilisateur.email}
                </p>


                <p>
                    <strong>Pays :</strong> {utilisateur.pays}
                </p>


                <p>
                    <strong>Niveau d'étude :</strong> {utilisateur.niveau_etude}
                </p>


                <p>
                    <strong>Date de création :</strong> {utilisateur.date_creation}
                </p>


            </div>



            <button onClick={handleLogout}>

                Se déconnecter

            </button>


        </div>

    );

}


export default Profil;