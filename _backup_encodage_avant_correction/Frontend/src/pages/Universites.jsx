import { API_ROUTES_URL } from "../config/api";
import { useEffect, useState } from "react";

import { useLocation, useNavigate } from "react-router-dom";

import {
    FaArrowLeft,
    FaUniversity,
    FaGlobe,
    FaMapMarkerAlt,
    FaHome,
    FaInfoCircle
} from "react-icons/fa";

import { MdLocationCity } from "react-icons/md";

import "../styles/Universites.css";

import { enregistrerAction } from "../services/historiqueService";


function Universites() {

    const navigate = useNavigate();

    const location = useLocation();


    /*
        DonnÃ©es reÃ§ues depuis Formations.jsx
    */

    const filiere = location.state?.filiere;

    const metier = location.state?.metier;

    const resultat = location.state?.resultat;


    const nomFiliere = filiere?.nom || "cette formation";

    const afficherTypeUniversite = (type) => {
    if (type === "privee") {
        return "PrivÃ©e";
    }

    if (type === "publique") {
        return "Publique";
    }

    return type || "Non renseignÃ©";
    };


    /*
        Etats
    */

    const [universites, setUniversites] = useState([]);

    const [chargement, setChargement] = useState(true);

    const [erreur, setErreur] = useState(null);


    /*
        VÃ©rification de sÃ©curitÃ©
    */

    if (!filiere) {

        return (

            <div className="universites-empty">

                <div className="universites-empty-icon">
                    <FaUniversity />
                </div>

                <h1>
                    Aucune formation sÃ©lectionnÃ©e
                </h1>

                <p>
                    Veuillez d'abord choisir une formation.
                </p>

                <button
                    className="empty-back-button"
                    onClick={() => navigate("/formations")}
                >
                    <FaArrowLeft />
                    Retour aux formations
                </button>

            </div>

        );

    }


    /*
        Chargement des universitÃ©s
    */

    useEffect(() => {

        const chargerUniversites = async () => {

            try {

                const reponse = await fetch(
                    `${API_ROUTES_URL}/universites.php?id_filiere=${filiere.id_filiere}`
                );


                const data = await reponse.json();


                console.log("UniversitÃ©s reÃ§ues :", data);


                if (data.success) {

                    setUniversites(data.universites);

                }

                else {

                    setErreur(data.message);

                }

            }

            catch (error) {

                console.error(error);

                setErreur(
                    "Erreur lors du chargement des universitÃ©s."
                );

            }

            finally {

                setChargement(false);

            }

        };


        chargerUniversites();

    }, [filiere]);


    /*
        Chargement
    */

    if (chargement) {

        return (

            <div className="universites-loading">

                <div className="universites-loading-spinner"></div>

                <h2>
                    Chargement des universitÃ©s...
                </h2>

                <p>
                    Veuillez patienter quelques instants.
                </p>

            </div>

        );

    }


    /*
        Gestion des erreurs
    */

    if (erreur) {

        return (

            <div className="universites-error">

                <div className="universites-state-icon">
                    <FaInfoCircle />
                </div>

                <h2>
                    {erreur}
                </h2>

                <p>
                    Une erreur est survenue lors du chargement
                    des Ã©tablissements.
                </p>

                <button
                    className="back-formation-button"
                    onClick={() =>
                        navigate("/formations", {
                            state: {
                                filiere,
                                metier,
                                resultat
                            }
                        })
                    }
                >
                    <FaArrowLeft />
                    Retour aux formations
                </button>

            </div>

        );

    }


    return (

        <div className="universites-page">


            {/* =====================================================
                NAVIGATION
            ===================================================== */}

            <nav className="universites-navigation">

                <button
                    className="universites-back-button"
                    onClick={() =>
                        navigate("/formations", {
                            state: {
                                filiere,
                                metier,
                                resultat
                            }
                        })
                    }
                >

                    <FaArrowLeft />

                    Retour aux formations

                </button>

            </nav>


            {/* =====================================================
                HERO
            ===================================================== */}

            <header className="universites-header">

                <div className="universites-header-icon">

                    <FaUniversity />

                </div>


                <div className="universites-header-content">

                    <span className="universites-eyebrow">
                        Ã‰TABLISSEMENTS DE FORMATION
                    </span>


                    <h1>

                        OÃ¹ Ã©tudier la filiÃ¨re{" "}

                        <span className="filiere-title">
                            {nomFiliere}
                        </span>
                        {" "}
                        ?

                    </h1>


                    <p>
                        DÃ©couvrez les Ã©tablissements qui proposent
                        cette formation et explorez leurs informations
                        pour prÃ©parer votre parcours universitaire.
                    </p>

                </div>

            </header>


            {/* =====================================================
                FILIERE SELECTIONNEE
            ===================================================== */}

            <section className="filiere-context">

                <div className="filiere-context-icon">

                    <FaUniversity />

                </div>


                <div className="filiere-context-content">

                    <span>
                        FORMATION SÃ‰LECTIONNÃ‰E
                    </span>

                    <strong>
                        {nomFiliere}
                    </strong>

                </div>

            </section>


            {/* =====================================================
                CONTENU PRINCIPAL
            ===================================================== */}

            <main className="universites-content">


                <div className="universites-section-header">

                    <div>

                        <span className="section-eyebrow">
                            Ã‰TABLISSEMENTS DISPONIBLES
                        </span>

                        <h2>
                            UniversitÃ©s proposant cette formation
                        </h2>

                        <p>
                            Consultez les Ã©tablissements disponibles
                            et accÃ©dez directement Ã  leur site officiel.
                        </p>

                    </div>


                    <div className="universites-count">

                        <FaUniversity />

                        <span>
                            {universites.length}
                        </span>

                        <small>
                            Ã©tablissement{universites.length > 1 ? "s" : ""} trouvÃ©{universites.length > 1 ? "s" : ""}
                        </small>

                    </div>

                </div>


                {/* =================================================
                    LISTE DES UNIVERSITES
                ================================================= */}

                {universites.length === 0 ? (

                    <div className="universites-empty">

                        <div className="universites-empty-icon">
                            <FaUniversity />
                        </div>

                        <h2>
                            Aucun Ã©tablissement trouvÃ©
                        </h2>

                        <p>
                            Aucune universitÃ© ne propose actuellement
                            cette formation dans notre catalogue.
                        </p>

                    </div>

                ) : (

                    <section className="universites-list">

                        {universites.map((universite) => (

                            <article
                                className="universite-card"
                                key={universite.id_universite}
                            >


                                {/* En-tÃªte carte */}

                                <div className="universite-card-header">

                                    <div className="universite-card-icon">

                                        <FaUniversity />

                                    </div>


                                    <div className="universite-card-title">

                                        <span>
                                            Ã‰TABLISSEMENT
                                        </span>

                                        <h3>
                                            {universite.nom}
                                        </h3>

                                    </div>

                                </div>


                                {/* Informations */}

                                <div className="universite-info">


                                    <div className="universite-info-item">

                                        <FaMapMarkerAlt />

                                        <div>

                                            <span>
                                                Ville
                                            </span>

                                            <strong>
                                                {universite.ville || "Non renseignÃ©e"}
                                            </strong>

                                        </div>

                                    </div>


                                    <div className="universite-info-item">

                                        <MdLocationCity />

                                        <div>

                                            <span>
                                                Pays
                                            </span>

                                            <strong>
                                                {universite.pays || "Non renseignÃ©"}
                                            </strong>

                                        </div>

                                    </div>


                                    <div className="universite-info-item">

                                        <FaUniversity />

                                        <div>

                                            <span>
                                                Type
                                            </span>

                                            <strong>
                                 {afficherTypeUniversite(universite.type)}
                                          </strong>

                                        </div>

                                    </div>


                                </div>


                                {/* Description */}

                                {universite.description && (

                                    <div className="universite-description">

                                        <FaInfoCircle />

                                        <p>
                                            {universite.description}
                                        </p>

                                    </div>

                                )}


                                {/* Action */}

                                {universite.site_web && (

                                    <div className="universite-card-action">

                                        <a
                                            href={universite.site_web}
                                            target="_blank"
                                            rel="noopener noreferrer"
                                            className="site-button"
                                            onClick={() =>
                                                enregistrerAction(
                                                    `UNIVERSITE_CONSULTEE: ${universite.nom}`
                                                )
                                            }
                                        >

                                            <FaGlobe />

                                            Visiter le site officiel

                                        </a>

                                    </div>

                                )}

                            </article>

                        ))}

                    </section>

                )}

            </main>


            {/* =====================================================
                FOOTER / ACTIONS
            ===================================================== */}

            <footer className="universites-footer">

                <div className="universites-footer-content">

                    <FaUniversity />

                    <p>
                        Comparez les Ã©tablissements et choisissez
                        celui qui correspond le mieux Ã  votre projet.
                    </p>

                </div>


                <div className="universites-actions">

                    <button
                        className="back-formation-button"
                        onClick={() =>
                            navigate("/formations", {
                                state: {
                                    filiere,
                                    metier,
                                    resultat
                                }
                            })
                        }
                    >

                        <FaArrowLeft />

                        Retour aux formations

                    </button>


                    <button
                        className="home-button"
                        onClick={() => navigate("/dashboard")}
                    >

                        <FaHome />

                        Retour Ã  l'accueil

                    </button>

                </div>

            </footer>


        </div>

    );

}


export default Universites;
