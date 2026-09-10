import { API_ROUTES_URL } from "../config/api";
import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";

import {
    FaArrowLeft,
    FaArrowRight,
    FaChartBar,
    FaTrophy,
    FaGraduationCap,
    FaTag,
    FaClock,
    FaUniversity,
    FaStar,
    FaLightbulb,
    FaBullseye,
    FaRedo,
    FaCalendarAlt,
    FaBriefcase,
    FaCheckCircle,
    FaCompass,
    FaInfoCircle
} from "react-icons/fa";

import "../styles/ResultatHistorique.css";
import FooterNavigation from "../components/FooterNavigation";


function ResultatHistorique() {

    const { id_test } = useParams();
    const navigate = useNavigate();
    console.log("ID TEST REÃ‡U PAR RESULTAT HISTORIQUE :", id_test);

    const [test, setTest] = useState(null);
    const [chargement, setChargement] = useState(true);
    const [erreur, setErreur] = useState("");


    // =========================================================
    // CHARGEMENT DU TEST
    // =========================================================

    useEffect(() => {

        const chargerTest = async () => {

            try {

                setChargement(true);
                setErreur("");

                const response = await fetch(
                    `${API_ROUTES_URL}/historique-test-detail.php?id_test=${id_test}`,
                    {
                        credentials: "include"
                    }
                );

                if (!response.ok) {
                    throw new Error("Erreur lors du chargement du test.");
                }

                const data = await response.json();

console.log("RÃ‰SULTAT API HISTORIQUE :", data);

if (!data.success) {
    throw new Error(
        data.message || "Impossible de rÃ©cupÃ©rer les rÃ©sultats."
    );
}

console.log("TEST REÃ‡U PAR REACT :", data.data);

setTest(data.data);

            } catch (error) {

                console.error(
                    "Erreur chargement rÃ©sultat historique :",
                    error
                );

                setErreur(
                    error.message ||
                    "Une erreur est survenue lors du chargement."
                );

            } finally {

                setChargement(false);

            }
        };

        chargerTest();

    }, [id_test]);


    // =========================================================
    // PROFILS RIASEC
    // =========================================================

    const profils = {

        RI: {
            nom: "RÃ©aliste â€“ Investigateur",
            description:
                "Vous Ãªtes une personne pratique, curieuse et analytique. Vous aimez comprendre comment les choses fonctionnent, rÃ©soudre des problÃ¨mes et travailler sur des situations concrÃ¨tes."
        },

        RA: {
            nom: "RÃ©aliste â€“ Artistique",
            description:
                "Vous combinez un esprit pratique avec une sensibilitÃ© crÃ©ative. Vous apprÃ©ciez les activitÃ©s concrÃ¨tes qui vous permettent Ã©galement d'exprimer votre imagination."
        },

        RS: {
            nom: "RÃ©aliste â€“ Social",
            description:
                "Vous aimez les activitÃ©s concrÃ¨tes tout en apprÃ©ciant le contact et l'aide aux autres. Vous pouvez Ãªtre Ã  l'aise dans des mÃ©tiers pratiques avec une dimension humaine."
        },

        RE: {
            nom: "RÃ©aliste â€“ Entreprenant",
            description:
                "Vous associez pragmatisme et esprit d'initiative. Vous aimez agir, prendre des responsabilitÃ©s et obtenir des rÃ©sultats concrets."
        },

        RC: {
            nom: "RÃ©aliste â€“ Conventionnel",
            description:
                "Vous apprÃ©ciez les activitÃ©s pratiques, organisÃ©es et structurÃ©es. Vous Ãªtes Ã  l'aise lorsque les tÃ¢ches suivent des mÃ©thodes prÃ©cises."
        },


        IR: {
            nom: "Investigateur â€“ RÃ©aliste",
            description:
                "Vous Ãªtes analytique tout en apprÃ©ciant les applications concrÃ¨tes. Vous aimez comprendre les problÃ¨mes puis rechercher des solutions pratiques."
        },

        IA: {
            nom: "Investigateur â€“ Artistique",
            description:
                "Vous combinez curiositÃ© intellectuelle et crÃ©ativitÃ©. Vous aimez explorer les idÃ©es, comprendre les phÃ©nomÃ¨nes et trouver des solutions originales."
        },

        IS: {
            nom: "Investigateur â€“ Social",
            description:
                "Vous aimez comprendre les problÃ¨mes et utiliser vos connaissances pour aider les autres. La recherche, l'analyse et la transmission peuvent vous correspondre."
        },

        IE: {
            nom: "Investigateur â€“ Entreprenant",
            description:
                "Vous associez analyse et esprit d'initiative. Vous aimez comprendre les situations, prendre des dÃ©cisions et transformer les idÃ©es en rÃ©sultats."
        },

        IC: {
            nom: "Investigateur â€“ Conventionnel",
            description:
                "Vous Ãªtes analytique, mÃ©thodique et organisÃ©. Vous apprÃ©ciez les environnements oÃ¹ les informations doivent Ãªtre Ã©tudiÃ©es avec prÃ©cision."
        },


        AR: {
            nom: "Artistique â€“ RÃ©aliste",
            description:
                "Vous associez crÃ©ativitÃ© et sens pratique. Vous aimez crÃ©er tout en gardant une approche concrÃ¨te et orientÃ©e vers la rÃ©alisation."
        },

        AI: {
            nom: "Artistique â€“ Investigateur",
            description:
                "Vous combinez imagination et curiositÃ© intellectuelle. Vous aimez explorer les idÃ©es et produire des solutions crÃ©atives."
        },

        AS: {
            nom: "Artistique â€“ Social",
            description:
                "Vous Ãªtes crÃ©atif et sensible aux besoins des autres. Vous pouvez apprÃ©cier les mÃ©tiers permettant d'exprimer votre crÃ©ativitÃ© tout en ayant une dimension humaine."
        },

        AE: {
            nom: "Artistique â€“ Entreprenant",
            description:
                "Vous associez crÃ©ativitÃ© et leadership. Vous aimez dÃ©velopper des idÃ©es, convaincre et transformer vos projets en rÃ©alisations."
        },

        AC: {
            nom: "Artistique â€“ Conventionnel",
            description:
                "Vous combinez crÃ©ativitÃ© et organisation. Vous apprÃ©ciez les environnements oÃ¹ vous pouvez crÃ©er tout en respectant une certaine structure."
        },


        SR: {
            nom: "Social â€“ RÃ©aliste",
            description:
                "Vous aimez aider les autres tout en apprÃ©ciant les activitÃ©s concrÃ¨tes. Vous pouvez Ãªtre Ã  l'aise dans des mÃ©tiers pratiques ayant une utilitÃ© humaine."
        },

        SI: {
            nom: "Social â€“ Investigateur",
            description:
                "Vous aimez comprendre les situations humaines et aider les autres grÃ¢ce Ã  vos connaissances. Vous pouvez apprÃ©cier l'analyse, la recherche et l'accompagnement."
        },

        SA: {
            nom: "Social â€“ Artistique",
            description:
                "Vous Ãªtes tournÃ© vers les autres et apprÃ©ciez l'expression crÃ©ative. Vous pouvez vous Ã©panouir dans des mÃ©tiers combinant relation humaine et crÃ©ativitÃ©."
        },

        SE: {
            nom: "Social â€“ Entreprenant",
            description:
                "Vous aimez travailler avec les autres et prendre des initiatives. Vous pouvez Ãªtre Ã  l'aise dans les mÃ©tiers de communication, de gestion et d'accompagnement."
        },

        SC: {
            nom: "Social â€“ Conventionnel",
            description:
                "Vous aimez aider les autres dans un environnement organisÃ© et structurÃ©. Vous apprÃ©ciez la prÃ©cision, la mÃ©thode et le sens du service."
        },


        ER: {
            nom: "Entreprenant â€“ RÃ©aliste",
            description:
                "Vous combinez esprit d'initiative et pragmatisme. Vous aimez agir, prendre des responsabilitÃ©s et obtenir des rÃ©sultats concrets."
        },

        EI: {
            nom: "Entreprenant â€“ Investigateur",
            description:
                "Vous associez esprit d'initiative et analyse. Vous aimez comprendre les situations, prendre des dÃ©cisions et dÃ©velopper des solutions."
        },

        EA: {
            nom: "Entreprenant â€“ Artistique",
            description:
                "Vous combinez leadership et crÃ©ativitÃ©. Vous aimez dÃ©fendre vos idÃ©es, convaincre et dÃ©velopper des projets originaux."
        },

        ES: {
            nom: "Entreprenant â€“ Social",
            description:
                "Vous Ãªtes dynamique, sociable et orientÃ© vers l'action. Vous aimez convaincre, coordonner et travailler avec les autres."
        },

        EC: {
            nom: "Entreprenant â€“ Conventionnel",
            description:
                "Vous combinez leadership, organisation et sens des responsabilitÃ©s. Vous apprÃ©ciez les environnements structurÃ©s oÃ¹ vous pouvez prendre des initiatives."
        },


        CR: {
            nom: "Conventionnel â€“ RÃ©aliste",
            description:
                "Vous Ãªtes organisÃ© et pratique. Vous apprÃ©ciez les tÃ¢ches structurÃ©es, prÃ©cises et concrÃ¨tes."
        },

        CI: {
            nom: "Conventionnel â€“ Investigateur",
            description:
                "Vous Ãªtes mÃ©thodique et analytique. Vous apprÃ©ciez les informations prÃ©cises, la recherche et les environnements structurÃ©s."
        },

        CA: {
            nom: "Conventionnel â€“ Artistique",
            description:
                "Vous associez organisation et crÃ©ativitÃ©. Vous aimez structurer vos activitÃ©s tout en conservant une certaine libertÃ© d'expression."
        },

        CS: {
            nom: "Conventionnel â€“ Social",
            description:
                "Vous Ãªtes organisÃ©, prÃ©cis et attentif aux autres. Vous apprÃ©ciez les environnements structurÃ©s avec une dimension humaine."
        },

        CE: {
            nom: "Conventionnel â€“ Entreprenant",
            description:
                "Vous combinez organisation et esprit d'initiative. Vous apprÃ©ciez la gestion, la coordination et les environnements structurÃ©s."
        }
    };


    // =========================================================
    // PROFIL PRINCIPAL
    // =========================================================

    const profilPrincipal =
        test?.profil?.principal ||
        test?.profil_dominant ||
        "";

    const profilInfo =
        profils[profilPrincipal] || {
            nom: "Profil RIASEC",
            description:
                "Votre profil permet d'identifier les environnements professionnels qui peuvent correspondre Ã  vos intÃ©rÃªts."
        };


    // =========================================================
    // SCORES RIASEC
    // =========================================================

    const scores = test
        ? [
            {
                lettre: "R",
                nom: "RÃ©aliste",
                score:
                    test.profil?.scores?.R ??
                    test.score_R ??
                    0
            },
            {
                lettre: "I",
                nom: "Investigateur",
                score:
                    test.profil?.scores?.I ??
                    test.score_I ??
                    0
            },
            {
                lettre: "A",
                nom: "Artistique",
                score:
                    test.profil?.scores?.A ??
                    test.score_A ??
                    0
            },
            {
                lettre: "S",
                nom: "Social",
                score:
                    test.profil?.scores?.S ??
                    test.score_S ??
                    0
            },
            {
                lettre: "E",
                nom: "Entreprenant",
                score:
                    test.profil?.scores?.E ??
                    test.score_E ??
                    0
            },
            {
                lettre: "C",
                nom: "Conventionnel",
                score:
                    test.profil?.scores?.C ??
                    test.score_C ??
                    0
            }
        ]
            .map((score) => ({
                ...score,
                pourcentage: Math.round(
                    (Number(score.score) / 10) * 100
                )
            }))
            .sort(
                (a, b) =>
                    b.pourcentage - a.pourcentage
            )
        : [];


    // =========================================================
    // RECOMMANDATIONS
    // =========================================================

    const metiersPrincipaux =
        test?.recommandations?.principaux || [];

    const metiersSecondaires =
        test?.recommandations?.secondaires || [];


    // =========================================================
    // FORMATIONS D'UN MÃ‰TIER
    // =========================================================

    const afficherFormations = (metier) => {

        if (
            !metier.filieres ||
            metier.filieres.length === 0
        ) {
            return (
                <div className="resultat-historique-no-formation">
                    <FaInfoCircle />
                    <p>
                        Aucune formation associÃ©e n'est
                        disponible pour ce mÃ©tier pour le moment.
                    </p>
                </div>
            );
        }

        return (
            <div className="resultat-historique-formations">

                <div className="resultat-historique-subsection-title">

                    <div className="resultat-historique-subsection-icon">
                        <FaGraduationCap />
                    </div>

                    <div>
                        <span>Ã‰tape suivante</span>
                        <h4>Formations associÃ©es</h4>
                    </div>

                </div>


                <div className="resultat-historique-formations-list">

                    {metier.filieres.map(
                        (formation, index) => {

                            const filiere =
                                formation.filiere ||
                                formation;

                            const universites =
                                formation.universites ||
                                [];

                            return (
                                <div
                                    className="resultat-historique-formation"
                                    key={
                                        filiere.id_filiere ||
                                        index
                                    }
                                >

                                    <div className="resultat-historique-formation-header">

                                        <div className="resultat-historique-formation-icon">
                                            <FaGraduationCap />
                                        </div>

                                        <div>

                                            <h5>
                                                {filiere.nom}
                                            </h5>

                                            <div className="resultat-historique-formation-meta">

                                                {filiere.domaine && (
                                                    <span>
                                                        <FaTag />
                                                        {filiere.domaine}
                                                    </span>
                                                )}

                                                {filiere.duree && (
                                                    <span>
                                                        <FaClock />
                                                        {filiere.duree}
                                                    </span>
                                                )}

                                            </div>

                                        </div>

                                    </div>


                                    <div className="resultat-historique-universites">

                                        <div className="resultat-historique-universites-title">

                                            <FaUniversity />

                                            <span>
                                                UniversitÃ©s disponibles
                                            </span>

                                        </div>


                                        {universites.length > 0 ? (

                                            <div className="resultat-historique-universites-list">

                                                {universites.map(
                                                    (
                                                        universite,
                                                        universityIndex
                                                    ) => (

                                                        <button
                                                            key={
                                                                universite.id_universite ||
                                                                universityIndex
                                                            }
                                                            className="resultat-historique-universite-button"
                                                            onClick={() =>
                                                                navigate(
                                                                    `/universite-catalogue/${universite.id_universite}`
                                                                )
                                                            }
                                                        >

                                                            <span>

                                                                <FaUniversity />

                                                                {universite.nom}

                                                            </span>

                                                            <FaArrowRight />

                                                        </button>

                                                    )
                                                )}

                                            </div>

                                        ) : (

                                            <p className="resultat-historique-no-universite">
                                                Aucune universitÃ©
                                                disponible pour cette
                                                formation.
                                            </p>

                                        )}

                                    </div>

                                </div>
                            );
                        }
                    )}

                </div>

            </div>
        );
    };


    // =========================================================
    // AFFICHAGE DES MÃ‰TIERS
    // =========================================================

    const afficherMetiers = (
        metiers,
        type
    ) => {

        if (!metiers || metiers.length === 0) {

            return (
                <div className="resultat-historique-no-metier">

                    <FaInfoCircle />

                    <p>
                        Aucune recommandation disponible
                        dans cette catÃ©gorie.
                    </p>

                </div>
            );
        }


        return (
            <div className="resultat-historique-metiers-list">

                {metiers.map(
                    (metier, index) => {

                        const principal =
                            type === "principal";

                        return (
                            <details
                                className={`resultat-historique-metier ${
                                    principal
                                        ? "principal"
                                        : "secondaire"
                                }`}
                                key={
                                    metier.id_metier ||
                                    index
                                }
                            >

                                <summary>

                                    <div className="resultat-historique-metier-summary">

                                        <div
                                            className={`resultat-historique-metier-badge ${
                                                principal
                                                    ? "principal"
                                                    : "secondaire"
                                            }`}
                                        >

                                            {principal ? (
                                                <>
                                                    <FaStar />
                                                    MÃ©tier recommandÃ©
                                                </>
                                            ) : (
                                                <>
                                                    <FaLightbulb />
                                                    Autre piste
                                                </>
                                            )}

                                        </div>


                                        <div className="resultat-historique-metier-title-row">

                                            <div className="resultat-historique-metier-icon">
                                                <FaBriefcase />
                                            </div>

                                            <div>

                                                <h3>
                                                    {metier.nom}
                                                </h3>

                                                <p>
                                                    DÃ©couvrez ce mÃ©tier,
                                                    les formations associÃ©es
                                                    et les universitÃ©s
                                                    disponibles.
                                                </p>

                                            </div>

                                        </div>

                                    </div>


                                    <div className="resultat-historique-metier-arrow">

                                        <FaArrowRight />

                                    </div>

                                </summary>


                                <div className="resultat-historique-metier-details">

                                    {metier.description && (

                                        <div className="resultat-historique-description">

                                            <div className="resultat-historique-description-icon">
                                                <FaInfoCircle />
                                            </div>

                                            <div>

                                                <span>
                                                    Ã€ propos du mÃ©tier
                                                </span>

                                                <h4>
                                                    PrÃ©sentation
                                                </h4>

                                                <p>
                                                    {metier.description}
                                                </p>

                                            </div>

                                        </div>

                                    )}


                                    {afficherFormations(metier)}

                                </div>

                            </details>
                        );
                    }
                )}

            </div>
        );
    };


    // =========================================================
    // CHARGEMENT
    // =========================================================

    if (chargement) {

        return (
            <div className="resultat-historique-page">

                <div className="resultat-historique-loading">

                    <div className="resultat-historique-loading-spinner"></div>

                    <FaCompass />

                    <h2>
                        Chargement de votre orientation...
                    </h2>

                    <p>
                        Nous prÃ©parons les rÃ©sultats de votre
                        parcours d'orientation.
                    </p>

                </div>

                <FooterNavigation />

            </div>
        );
    }


    // =========================================================
    // ERREUR
    // =========================================================

    if (erreur || !test) {

        return (
            <div className="resultat-historique-page">

                <div className="resultat-historique-error">

                    <div className="resultat-historique-error-icon">
                        <FaInfoCircle />
                    </div>

                    <h2>
                        Impossible d'afficher ce rÃ©sultat
                    </h2>

                    <p>
                        {erreur ||
                            "Le rÃ©sultat demandÃ© est introuvable."}
                    </p>

                    <button
                        className="resultat-historique-error-button"
                        onClick={() =>
                            navigate("/historique-tests")
                        }
                    >
                        <FaArrowLeft />
                        Retour Ã  mon historique
                    </button>

                </div>

                <FooterNavigation />

            </div>
        );
    }


    // =========================================================
    // PAGE PRINCIPALE
    // =========================================================

    return (
        <div className="resultat-historique-page">


            {/* =====================================================
                HEADER
            ====================================================== */}

            <header className="resultat-historique-header">

                <div className="resultat-historique-header-content">

                    <div className="resultat-historique-header-title">

                        <div className="resultat-historique-header-icon">
                            <FaChartBar />
                        </div>

                        <div>

                            <span className="resultat-historique-label">
                                Mon orientation
                            </span>

                            <h1>
                                RÃ©sultat de mon test
                            </h1>

                            <p>
                                <FaCalendarAlt />

                                Test effectuÃ© le{" "}

                                {new Date(
                                    test.date_test
                                ).toLocaleDateString(
                                    "fr-FR",
                                    {
                                        day: "2-digit",
                                        month: "long",
                                        year: "numeric"
                                    }
                                )}

                            </p>

                        </div>

                    </div>


                    <button
                        className="resultat-historique-retour-top"
                        onClick={() =>
                            navigate("/historique-tests")
                        }
                    >

                        <FaArrowLeft />

                        Retour Ã  mon historique

                    </button>

                </div>


                <span className="resultat-historique-test-id">

                    Test #{test.numero_test}

                </span>

            </header>


            {/* =====================================================
                RÃ‰SUMÃ‰ DU PARCOURS
            ====================================================== */}

            <section className="resultat-historique-resume">

                <div className="resultat-historique-resume-header">

                    <div className="resultat-historique-resume-icon">
                        <FaCompass />
                    </div>

                    <div>

                        <span>
                            Votre parcours
                        </span>

                        <h2>
                            De votre profil Ã  votre avenir
                        </h2>

                        <p>
                            Explorez progressivement votre profil,
                            les mÃ©tiers recommandÃ©s, les formations
                            associÃ©es et les universitÃ©s disponibles.
                        </p>

                    </div>

                </div>


                <div className="resultat-historique-parcours">

                    <div className="resultat-parcours-item active">

                        <div className="resultat-parcours-icon">
                            <FaBullseye />
                        </div>

                        <div>

                            <span>
                                Ã‰tape 01
                            </span>

                            <strong>
                                Profil
                            </strong>

                        </div>

                    </div>


                    <div className="resultat-parcours-line"></div>


                    <div className="resultat-parcours-item">

                        <div className="resultat-parcours-icon">
                            <FaBriefcase />
                        </div>

                        <div>

                            <span>
                                Ã‰tape 02
                            </span>

                            <strong>
                                MÃ©tiers
                            </strong>

                        </div>

                    </div>


                    <div className="resultat-parcours-line"></div>


                    <div className="resultat-parcours-item">

                        <div className="resultat-parcours-icon">
                            <FaGraduationCap />
                        </div>

                        <div>

                            <span>
                                Ã‰tape 03
                            </span>

                            <strong>
                                Formations
                            </strong>

                        </div>

                    </div>


                    <div className="resultat-parcours-line"></div>


                    <div className="resultat-parcours-item">

                        <div className="resultat-parcours-icon">
                            <FaUniversity />
                        </div>

                        <div>

                            <span>
                                Ã‰tape 04
                            </span>

                            <strong>
                                UniversitÃ©s
                            </strong>

                        </div>

                    </div>

                </div>

            </section>


            {/* =====================================================
                PROFIL DOMINANT
            ====================================================== */}

            <section className="resultat-historique-profil">

                <div className="resultat-historique-profil-label">

                    <FaTrophy />

                    Votre profil dominant

                </div>


                <div className="resultat-historique-profil-content">

                    <div className="resultat-historique-code">

                        {profilPrincipal}

                    </div>


                    <div className="resultat-historique-profil-text">

                        <span>
                            Profil RIASEC
                        </span>

                        <h2>
                            {profilInfo.nom}
                        </h2>

                        <p>
                            {profilInfo.description}
                        </p>

                    </div>

                </div>

            </section>


            {/* =====================================================
                SCORES RIASEC
            ====================================================== */}

            <section className="resultat-historique-scores">

                <div className="resultat-historique-section-title">

                    <div className="resultat-historique-section-title-icon">
                        <FaChartBar />
                    </div>

                    <div>

                        <span>
                            Ã‰tape 01 Â· Comprendre
                        </span>

                        <h2>
                            Vos scores RIASEC
                        </h2>

                        <p>
                            Voici les six dimensions qui composent
                            votre profil professionnel.
                        </p>

                    </div>

                </div>


                <div className="resultat-scores-list">

                    {scores.map(
                        (score) => (

                            <div
                                className="resultat-score-item"
                                key={score.lettre}
                            >

                                <div className="resultat-score-header">

                                    <div className="resultat-score-letter">
                                        {score.lettre}
                                    </div>

                                    <strong>
                                        {score.nom}
                                    </strong>

                                    <b>
                                        {score.pourcentage}%
                                    </b>

                                </div>


                                <div className="resultat-score-bar">

                                    <div
                                        className="resultat-score-progress"
                                        style={{
                                            width: `${score.pourcentage}%`
                                        }}
                                    />

                                </div>

                            </div>

                        )
                    )}

                </div>

            </section>


            {/* =====================================================
                BLOC DE CONFIANCE
            ====================================================== */}

            <section className="resultat-historique-confiance">

                <div className="resultat-historique-confiance-icon">
                    <FaBullseye />
                </div>

                <div>

                    <span>
                        Comprendre votre orientation
                    </span>

                    <h3>
                        Pourquoi ces recommandations ?
                    </h3>

                    <p>
                        Les mÃ©tiers prÃ©sentÃ©s ci-dessous sont proposÃ©s
                        Ã  partir des tendances identifiÃ©es dans votre
                        profil RIASEC. Ils constituent des pistes
                        d'exploration pour vous aider Ã  construire
                        progressivement votre projet d'orientation.
                    </p>

                </div>

            </section>


            {/* =====================================================
                MÃ‰TIERS
            ====================================================== */}

            <section className="resultat-historique-recommandations">

                <div className="resultat-historique-section-header">

                    <div className="resultat-historique-section-header-icon">
                        <FaBriefcase />
                    </div>

                    <div>

                        <span>
                            Ã‰tape 02 Â· DÃ©couvrir
                        </span>

                        <h2>
                            MÃ©tiers recommandÃ©s
                        </h2>

                        <p>
                            DÃ©couvrez les mÃ©tiers qui peuvent correspondre
                            Ã  votre profil et explorez leur parcours de formation.
                        </p>

                    </div>

                </div>


                {/* MÃ‰TIERS PRINCIPAUX */}

                <div className="resultat-historique-category">

                    <div className="resultat-historique-category-heading">

                        <div className="resultat-historique-category-icon principal">
                            <FaStar />
                        </div>

                        <div>

                            <span>
                                Vos meilleures correspondances
                            </span>

                            <h3>
                                MÃ©tiers principaux
                            </h3>

                        </div>

                    </div>


                    {afficherMetiers(
                        metiersPrincipaux,
                        "principal"
                    )}

                </div>


                {/* MÃ‰TIERS SECONDAIRES */}

                <div className="resultat-historique-category secondaire">

                    <div className="resultat-historique-category-heading">

                        <div className="resultat-historique-category-icon secondaire">
                            <FaLightbulb />
                        </div>

                        <div>

                            <span>
                                D'autres possibilitÃ©s
                            </span>

                            <h3>
                                Autres pistes Ã  explorer
                            </h3>

                        </div>

                    </div>


                    <p className="resultat-historique-secondary-intro">

                        Ces mÃ©tiers constituent d'autres possibilitÃ©s
                        compatibles avec votre profil. Prenez le temps
                        de les dÃ©couvrir avant de faire votre choix.

                    </p>


                    {afficherMetiers(
                        metiersSecondaires,
                        "secondaire"
                    )}

                </div>

            </section>
            {/* =====================================================
                PROCHAINE Ã‰TAPE
            ====================================================== */}

            <section className="resultat-historique-next-step">

                <div className="resultat-historique-next-step-icon">
                    <FaGraduationCap />
                </div>

                <div className="resultat-historique-next-step-content">

                    <span>
                        Ã‰tape 03 Â· Construire
                    </span>

                    <h2>
                        Votre orientation ne s'arrÃªte pas ici
                    </h2>

                    <p>
                        Un mÃ©tier est le dÃ©but de votre rÃ©flexion.
                        Explorez les formations associÃ©es et dÃ©couvrez
                        les Ã©tablissements oÃ¹ vous pourriez poursuivre
                        vos Ã©tudes.
                    </p>

                </div>

            </section>


            {/* =====================================================
                RÃ‰SUMÃ‰ FINAL DU PARCOURS
            ====================================================== */}

            <section className="resultat-historique-parcours-final">

                <div className="resultat-historique-final-title">

                    <div className="resultat-historique-final-icon">
                        <FaCompass />
                    </div>

                    <div>

                        <span>
                            Votre prochaine dÃ©marche
                        </span>

                        <h2>
                            Construisez votre projet
                        </h2>

                    </div>

                </div>


                <div className="resultat-historique-final-steps">

                    <div className="resultat-final-step">

                        <div className="resultat-final-step-number">
                            01
                        </div>

                        <div>

                            <FaBriefcase />

                            <strong>
                                Explorez les mÃ©tiers
                            </strong>

                            <p>
                                DÃ©couvrez les mÃ©tiers qui correspondent
                                le mieux Ã  votre profil.
                            </p>

                        </div>

                    </div>


                    <div className="resultat-final-step">

                        <div className="resultat-final-step-number">
                            02
                        </div>

                        <div>

                            <FaGraduationCap />

                            <strong>
                                Comparez les formations
                            </strong>

                            <p>
                                Identifiez les filiÃ¨res permettant
                                d'accÃ©der aux mÃ©tiers qui vous intÃ©ressent.
                            </p>

                        </div>

                    </div>


                    <div className="resultat-final-step">

                        <div className="resultat-final-step-number">
                            03
                        </div>

                        <div>

                            <FaUniversity />

                            <strong>
                                DÃ©couvrez les universitÃ©s
                            </strong>

                            <p>
                                Consultez les Ã©tablissements proposant
                                les formations adaptÃ©es Ã  votre projet.
                            </p>

                        </div>

                    </div>

                </div>

            </section>


            {/* =====================================================
                MESSAGE FINAL
            ====================================================== */}

            <section className="resultat-historique-message-final">

                <FaCheckCircle />

                <div>

                    <h3>
                        Vous avez maintenant une premiÃ¨re direction.
                    </h3>

                    <p>
                        Prenez le temps d'explorer les diffÃ©rentes
                        possibilitÃ©s. Votre choix d'orientation se
                        construit progressivement, en fonction de vos
                        intÃ©rÃªts, de vos objectifs et de votre projet.
                    </p>

                </div>

            </section>


            {/* =====================================================
                ACTIONS FINALES
            ====================================================== */}

            <div className="resultat-historique-actions">

                <button
                    className="resultat-historique-action-retour"
                    onClick={() =>
                        navigate("/historique-tests")
                    }
                >

                    <FaArrowLeft />

                    Retour Ã  mon historique

                </button>


                <button
                    className="resultat-historique-action-test"
                    onClick={() =>
                        navigate("/test")
                    }
                >

                    <FaRedo />

                    Refaire un test

                    <FaArrowRight />

                </button>

            </div>


            {/* =====================================================
                FOOTER
            ====================================================== */}

            <FooterNavigation />

        </div>
    );
}

export default ResultatHistorique;
