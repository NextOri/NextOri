import React, { useState, useEffect } from "react";
import "../styles/Metiers.css";
import FooterNavigation from "../components/FooterNavigation";
import { useNavigate } from "react-router-dom";


function Metiers() {
     
    const navigate = useNavigate();
    // 1) États
    const [metiers, setMetiers] = useState([]);
    const [recherche, setRecherche] = useState("");
    const [secteur, setSecteur] = useState("Tous");
    const [niveauEtude, setNiveauEtude] = useState("Tous");


   
  

    // 2) Récupération des métiers depuis le backend
    useEffect(() => {

        fetch("http://localhost/NextOri/Backend/api/routes/metiers.php")

            .then((response) => response.json())

            .then((data) => {

                if (data.success) {

                    setMetiers(data.data);

                }

            })

            .catch((error) => {

                console.error(
                    "Erreur récupération métiers :",
                    error
                );

            });


    }, []);

     const getTendanceIcon = (tendance) => {

    switch (tendance) {

        case "Très forte croissance":
            return "🚀";

        case "Forte croissance":
            return "📈";

        case "En croissance":
            return "↗️";

        case "Stable":
            return "➖";

        case "En baisse":
            return "📉";

        default:
            return "📊";
    }

    };

     const getTendanceClass = (tendance) => {

    switch (tendance) {

        case "Très forte croissance":
            return "tendance-tres-forte";

        case "Forte croissance":
            return "tendance-forte";

        case "En croissance":
            return "tendance-croissance";

        case "Stable":
            return "tendance-stable";

        case "En baisse":
            return "tendance-baisse";

        default:
            return "";
    }

    };



    const secteurs = [
        "Tous",
        ...new Set(metiers.map((metier) => metier.secteur))
    ];


    const niveaux = [
        "Tous",
        ...new Set(metiers.map((metier) => metier.niveau_etude))
    ];



    const resultats = metiers.filter((metier) => {


        const rechercheOK =
            metier.nom
            .toLowerCase()
            .includes(recherche.toLowerCase());


        const secteurOK =
            secteur === "Tous" ||
            metier.secteur === secteur;


        const niveauOK =
            niveauEtude === "Tous" ||
            metier.niveau_etude === niveauEtude;



        return rechercheOK && secteurOK && niveauOK;


    });

   






    return (

        <div className="metiers-page">


            <div className="metiers-header">

                <h1>
                    💼 Catalogue des métiers
                </h1>


                <p>
                    Découvrez les métiers, leurs secteurs,
                    niveaux d'études, salaires et tendances.
                </p>

            </div>



          <div className="metiers-filtres">

    <div className="filtre-item">

        <label>

            🔍 Rechercher

        </label>

        <input

            className="metiers-search"

            type="text"

            placeholder="Ex : Développeur Web..."

            value={recherche}

            onChange={(e)=>setRecherche(e.target.value)}

        />

    </div>



    <div className="filtre-item">

        <label>

            🏢 Secteur

        </label>

        <select

            value={secteur}

            onChange={(e)=>setSecteur(e.target.value)}

        >

            {

                secteurs.map((item)=>(

                    <option
                        key={item}
                        value={item}
                    >

                        {item}

                    </option>

                ))

            }

        </select>

    </div>



    <div className="filtre-item">

        <label>

            🎓 Niveau d'étude

        </label>

        <select

            value={niveauEtude}

            onChange={(e)=>setNiveauEtude(e.target.value)}

        >

            {

                niveaux.map((item)=>(

                    <option
                        key={item}
                        value={item}
                    >

                        {item}

                    </option>

                ))

            }

        </select>

    </div>

</div>

           <div className="metiers-count">

             {resultats.length} métier{resultats.length > 1 ? "s" : ""} trouvé{resultats.length > 1 ? "s" : ""}

           </div>

           <div className="metiers-list">

    {

        resultats.length > 0 ?

        (

            resultats.map((metier) => (

                <div
                    className="metier-card"
                    key={metier.id_metier}
                >
                    

                    <h2>
                        {metier.nom}

                    </h2>

                    <div className="metier-top-bar"></div>


                    <p>
                        {metier.description}
                    </p>


                    <p>
                        <strong>🏢 Secteur :</strong>{" "}
                        {metier.secteur}
                    </p>


                    <p>
                        <strong>🎓 Niveau d'étude :</strong>{" "}
                        {metier.niveau_etude}
                    </p>


            <p>
                        <strong>💰 Salaire :</strong>{" "}
                   {metier.salaire_min.toLocaleString("fr-FR")}
                 {" à "}
                 {metier.salaire_max.toLocaleString("fr-FR")}
                {" FCFA"}
            </p>

                             <p>

    <strong>Tendance :</strong>

    <span
        className={`tendance-badge ${getTendanceClass(metier.tendance)}`}
    >

        {getTendanceIcon(metier.tendance)}
        {" "}
        {metier.tendance}

    </span>


      </p>


                    <button className="metier-button"
                    onClick={() => navigate(`/metiers/${metier.id_metier}`)}
                    >
                        

                        Voir détails →

                    </button>

                </div>

            ))

        )


        :

        (

            <div className="aucun-metier">

                <h2>

                    😕 Aucun métier trouvé

                </h2>


                <p>

                    Essayez un autre mot-clé,
                    un autre secteur
                    ou un autre niveau d'étude.

                </p>

            </div>

        )

    }

</div>

<FooterNavigation />


        </div>

    );



}



export default Metiers;