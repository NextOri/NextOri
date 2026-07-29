import React, { useState, useEffect } from "react";
import "../styles/Filieres.css";
import FooterNavigation from "../components/FooterNavigation";
import { useNavigate } from "react-router-dom";

function Filieres() {

    const navigate = useNavigate();

    const [filieres, setFilieres] = useState([]);

    const [recherche, setRecherche] = useState("");

    const [domaine, setDomaine] = useState("Tous");

    const [duree, setDuree] = useState("Tous");



    useEffect(() => {

        fetch("http://localhost/NextOri/Backend/api/routes/filiere.php")

            .then((response) => response.json())

            .then((data) => {

                if (data.success) {

                    setFilieres(data.data);

                }

            })

            .catch((error) => {

                console.error(
                    "Erreur récupération filières :",
                    error
                );

            });

    }, []);



    const domaines = [

        "Tous",

        ...new Set(

            filieres.map((filiere) => filiere.domaine)

        )

    ];



    const durees = [

        "Tous",

        ...new Set(

            filieres.map((filiere) => filiere.duree)

        )

    ];



    const resultats = filieres.filter((filiere) => {

        const rechercheOK =

            filiere.nom

                .toLowerCase()

                .includes(recherche.toLowerCase());



        const domaineOK =

            domaine === "Tous"

                ? true

                : filiere.domaine === domaine;



        const dureeOK =

            duree === "Tous"

                ? true

                : filiere.duree === duree;



        return rechercheOK && domaineOK && dureeOK;

    });



    return (

        <div className="filieres-page">

            <div className="filieres-header">

                <h1>

                    🎓 Catalogue des filières

                </h1>

                <p>

                    Découvrez les différentes filières,

                    leurs domaines et leurs durées.

                </p>

            </div>



            <div className="filieres-filtres">

                <div className="filtre-item">

                    <label>

                        🔍 Rechercher

                    </label>

                    <input

                        type="text"

                        className="filieres-search"

                        placeholder="Ex : Informatique..."

                        value={recherche}

                        onChange={(e) =>

                            setRecherche(e.target.value)

                        }

                    />

                </div>



                <div className="filtre-item">

                    <label>

                        🏷 Domaine

                    </label>

                    <select

                        value={domaine}

                        onChange={(e) =>

                            setDomaine(e.target.value)

                        }

                    >

                        {

                            domaines.map((item) => (

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

                        ⏳ Durée

                    </label>

                    <select

                        value={duree}

                        onChange={(e) =>

                            setDuree(e.target.value)

                        }

                    >

                        {

                            durees.map((item) => (

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



            <div className="filieres-count">

                {resultats.length}

                {" "}

                filière

                {resultats.length > 1 ? "s" : ""}

                {" "}

                trouvée

                {resultats.length > 1 ? "s" : ""}

            </div>



            <div className="filieres-list">

                {

                    resultats.length > 0 ?

                        (

                            resultats.map((filiere) => (

                                <div

                                    className="filiere-card"

                                    key={filiere.id_filiere}

                                >

                                    <h2>

                                        {filiere.nom}

                                    </h2>

                                    <div className="filiere-top-bar"></div>

                                    <p>

                                        {filiere.description}

                                    </p>

                                    <p>

                                        <strong>

                                            🏷 Domaine :

                                        </strong>

                                        {" "}

                                        {filiere.domaine}

                                    </p>

                                    <p>

                                        <strong>

                                            ⏳ Durée :

                                        </strong>

                                        {" "}

                                        {filiere.duree}

                                    </p>

                                    <button

                                        className="filiere-button"

                                        onClick={() =>

                                            navigate(`/filieres/${filiere.id_filiere}`)

                                        }

                                    >

                                        Voir détails →

                                    </button>

                                </div>

                            ))

                        )

                        :

                        (

                            <div className="aucune-filiere">

                                <h2>

                                    😕 Aucune filière trouvée

                                </h2>

                                <p>

                                    Essayez un autre mot-clé,

                                    un autre domaine

                                    ou une autre durée.

                                </p>

                            </div>

                        )

                }

            </div>

            <FooterNavigation />

        </div>

    );

}

export default Filieres;