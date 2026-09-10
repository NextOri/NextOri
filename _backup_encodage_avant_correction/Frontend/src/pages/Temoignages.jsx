import { API_ROUTES_URL } from "../config/api";
import React, { useEffect, useState } from "react";
import { Star, MessageSquare, ArrowRight, Loader2 } from "lucide-react";
import { useNavigate } from "react-router-dom";
import "../styles/Temoignages.css";
import FooterNavigation from "../components/FooterNavigation";

const API_URL =
    `${API_ROUTES_URL}/temoignages.php`;

function Temoignages() {

    const navigate = useNavigate();

    const [temoignages, setTemoignages] = useState([]);
    const [chargement, setChargement] = useState(true);
    const [erreur, setErreur] = useState("");

    useEffect(() => {

        const chargerTemoignages = async () => {

            try {

                const response = await fetch(API_URL);

                const data = await response.json();

                if (!response.ok || !data.success) {
                    throw new Error(
                        data.message ||
                        "Impossible de rÃ©cupÃ©rer les tÃ©moignages."
                    );
                }

                setTemoignages(data.temoignages || []);

            } catch (error) {

                console.error("Erreur tÃ©moignages :", error);

                setErreur(
                    "Impossible de charger les tÃ©moignages pour le moment."
                );

            } finally {

                setChargement(false);

            }

        };

        chargerTemoignages();

    }, []);


    const moyenne = temoignages.length
        ? (
            temoignages.reduce(
                (total, temoignage) => total + Number(temoignage.note),
                0
            ) / temoignages.length
        ).toFixed(1)
        : "0.0";


    const afficherEtoiles = (note) => {

        return Array.from({ length: 5 }, (_, index) => (
            <Star
                key={index}
                className={index < Number(note) ? "star-active" : "star-empty"}
                fill={index < Number(note) ? "currentColor" : "none"}
            />
        ));

    };


    return (

        <main className="temoignages-page">

            {/* HERO */}

            <section className="temoignages-hero">

                <div className="temoignages-hero-content">

                    <span className="temoignages-label">
                        EXPÃ‰RIENCES NEXTORI
                    </span>

                    <h1>
                        Ce que pensent
                        <span> nos utilisateurs.</span>
                    </h1>

                    <p>
                        DÃ©couvrez les expÃ©riences de ceux qui utilisent
                        NextOri pour mieux comprendre leur orientation
                        et construire leur avenir.
                    </p>

                    <button
                        type="button"
                        className="temoignages-cta"
                        onClick={() => navigate("/avis")}
                    >
                        <MessageSquare />
                        Partager mon expÃ©rience
                        <ArrowRight />
                    </button>

                </div>

                <div className="temoignages-stat">

                    <div className="stat-note">
                        <Star fill="currentColor" />
                        <strong>{moyenne}</strong>
                        <span>/ 5</span>
                    </div>

                    <p>
                        {temoignages.length} tÃ©moignage
                        {temoignages.length > 1 ? "s" : ""}
                    </p>

                </div>

            </section>


            {/* CONTENU */}

            <section className="temoignages-content">

                <div className="temoignages-heading">

                    <span>LA COMMUNAUTÃ‰ NEXTORI</span>

                    <h2>
                        Ils partagent leur expÃ©rience
                    </h2>

                    <p>
                        Des retours authentiques de membres de la
                        communautÃ© NextOri.
                    </p>

                </div>


                {chargement && (

                    <div className="temoignages-loading">

                        <Loader2 className="loading-icon" />

                        <p>
                            Chargement des tÃ©moignages...
                        </p>

                    </div>

                )}


                {!chargement && erreur && (

                    <div className="temoignages-error">

                        <MessageSquare />

                        <p>
                            {erreur}
                        </p>

                    </div>

                )}


                {!chargement &&
                    !erreur &&
                    temoignages.length === 0 && (

                        <div className="temoignages-empty">

                            <MessageSquare />

                            <h3>
                                Les premiers tÃ©moignages arrivent bientÃ´t.
                            </h3>

                            <p>
                                Votre expÃ©rience pourrait Ãªtre la premiÃ¨re
                                Ã  inspirer notre communautÃ©.
                            </p>

                            <button
                                type="button"
                                onClick={() => navigate("/avis")}
                            >
                                Donner mon avis
                                <ArrowRight />
                            </button>

                        </div>

                    )}


                {!chargement &&
                    !erreur &&
                    temoignages.length > 0 && (

                        <div className="temoignages-grid">

                            {temoignages.map((temoignage) => (

                                <article
                                    className="temoignage-card"
                                    key={temoignage.id_avis}
                                >

                                    <div className="temoignage-stars">

                                        {afficherEtoiles(
                                            temoignage.note
                                        )}

                                    </div>


                                    <p className="temoignage-commentaire">
                                        Â« {temoignage.commentaire} Â»
                                    </p>


                                    <div className="temoignage-author">

    <div className="temoignage-avatar">
        {temoignage.nom_utilisateur
            ?.charAt(0)
            ?.toUpperCase() || "N"}
    </div>

    <div>

        <strong>
            {temoignage.nom_utilisateur || "Utilisateur NextOri"}
        </strong>

        <span>
            Membre de NextOri
        </span>

    </div>

</div>

                                </article>

                            ))}

                        </div>

                    )}

            </section>


            {/* CTA FINAL */}

            {!chargement && temoignages.length > 0 && (

                <section className="temoignages-bottom-cta">

                    <div>

                        <span>
                            VOTRE EXPÃ‰RIENCE COMPTE
                        </span>

                        <h2>
                            Et vous, que pensez-vous de NextOri ?
                        </h2>

                        <p>
                            Votre retour peut aider NextOri Ã  devenir
                            encore plus utile pour les Ã©tudiants.
                        </p>

                    </div>

                    <button
                        type="button"
                        onClick={() => navigate("/avis")}
                    >
                        Partager mon expÃ©rience
                        <ArrowRight />
                    </button>

                </section>

            )}

            {/* FOOTER */}
            
                        <FooterNavigation />

        </main>

    );

}

export default Temoignages;
