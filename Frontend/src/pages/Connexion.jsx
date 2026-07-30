import { useState } from "react";
import { login } from "../services/AuthService";
import { useNavigate } from "react-router-dom";

function Connexion() {

    const navigate = useNavigate();

    const [formData, setFormData] = useState({
        email: "",
        mot_de_passe: ""
    });


    const [message, setMessage] = useState("");

    const [utilisateur, setUtilisateur] = useState(null);



    const handleChange = (e) => {

        setFormData({
            ...formData,
            [e.target.name]: e.target.value
        });

    };



    const handleSubmit = async (e) => {

        e.preventDefault();


        const resultat = await login(
            formData.email,
            formData.mot_de_passe
        );


        if (resultat.success) {

            setMessage("Connexion réussie.");

            setUtilisateur(
                resultat.utilisateur
            );


            // Pour garder l'utilisateur connecté temporairement
            localStorage.setItem(
                "utilisateur",
                JSON.stringify(resultat.utilisateur)
            );

           
        navigate("/dashboard");

            


        } else {

            setMessage(
                resultat.message
            );

            setUtilisateur(null);

        }

    };



    return (

        <div>

            <h1>
                Connexion
            </h1>


            <form onSubmit={handleSubmit}>


                <input
                    type="email"
                    name="email"
                    placeholder="Email"
                    value={formData.email}
                    onChange={handleChange}
                />


                <input
                    type="password"
                    name="mot_de_passe"
                    placeholder="Mot de passe"
                    value={formData.mot_de_passe}
                    onChange={handleChange}
                />


                <button type="submit">
                    Se connecter
                </button>


            </form>



            {message && (

                <p>
                    {message}
                </p>

            )}



            {utilisateur && (

                <div>

                    <h3>
                        Bienvenue {utilisateur.nom}
                    </h3>

                </div>

            )}


        </div>

    );

}


export default Connexion;