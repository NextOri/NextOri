import { useState } from "react";
import { register } from "../services/AuthService";
import { useNavigate } from "react-router-dom";


function Inscription() {

    const navigate = useNavigate();

    const [formData, setFormData] = useState({
        nom: "",
        email: "",
        mot_de_passe: "",
        pays: "",
        niveau_etude: ""
    });


    const [message, setMessage] = useState("");


    const handleChange = (e) => {

        setFormData({
            ...formData,
            [e.target.name]: e.target.value
        });

    };


    const handleSubmit = async (e) => {

        e.preventDefault();


        const resultat = await register(formData);


        if (resultat.success) {

            setMessage("Compte créé avec succès.");

            localStorage.setItem(
         "utilisateur",
         JSON.stringify(resultat.utilisateur)
         );

          navigate("/dashboard");

            setFormData({
                nom: "",
                email: "",
                mot_de_passe: "",
                pays: "",
                niveau_etude: ""
            });

        } else {

            setMessage(resultat.message);

        }

    };


    return (

        <div>

            <h1>Créer un compte</h1>


            <form onSubmit={handleSubmit}>


                <input
                    type="text"
                    name="nom"
                    placeholder="Nom complet"
                    value={formData.nom}
                    onChange={handleChange}
                />


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


                <input
                    type="text"
                    name="pays"
                    placeholder="Pays"
                    value={formData.pays}
                    onChange={handleChange}
                />


                <input
                    type="text"
                    name="niveau_etude"
                    placeholder="Niveau d'étude"
                    value={formData.niveau_etude}
                    onChange={handleChange}
                />


                <button type="submit">
                    Créer mon compte
                </button>


            </form>


            {message && (

                <p>
                    {message}
                </p>

            )}


        </div>

    );

}


export default Inscription;