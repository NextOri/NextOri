import { API_ROUTES_URL } from "../config/api";
import Confetti from "react-confetti";
import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import "../styles/Result.css";
import { enregistrerAction } from "../services/historiqueService";

import {
    FaTrophy,
    FaChartBar,
    FaFolderOpen,
    FaGraduationCap,
    FaMoneyBillWave,
    FaHome,
    FaRedo,
    FaArrowRight,
    FaFileAlt,
    FaStar,
    FaCheckCircle,
    FaCompass,
    FaLightbulb,
    FaBullseye,
    FaSearch,
    FaUniversity
} from "react-icons/fa";


function Result(){

    /* =========================================================
       ETAT CONFETTIS
    ========================================================= */

    const [showConfetti, setShowConfetti] = useState(true);

    useEffect(() => {

        const timer = setTimeout(() => {
            setShowConfetti(false);
        }, 4000);

        return () => clearTimeout(timer);

    }, []);


    /* =========================================================
       NAVIGATION
    ========================================================= */

    const location = useLocation();
    const navigate = useNavigate();


    /* =========================================================
       RECUPERATION DU RESULTAT
    ========================================================= */

    const resultatInitial =
        location.state?.data?.data ??
        location.state?.data;


    console.log("STATE RESULT :", location.state);
    console.log("DATA RESULT :", resultatInitial);


    const [resultat, setResultat] = useState(resultatInitial);
    const [chargement, setChargement] = useState(!resultatInitial);


    /* =========================================================
       RECUPERATION DU RESULTAT DEPUIS L'API
    ========================================================= */

    useEffect(() => {

        if (!resultat) {

            setChargement(true);

            fetch(
                `${API_ROUTES_URL}/resultats.php`,
                {
                    credentials: "include"
                }
            )
            .then(async response => {

                const data = await response.json();

                if (response.status === 401) {

                    localStorage.removeItem("utilisateur");

                    navigate("/connexion", {
                        replace: true
                    });

                    return null;
                }

                return data;
            })
            .then(data => {

                if (!data) return;

                if (data.success) {
                    setResultat(data.data);
                }

                setChargement(false);

            })
            .catch(error => {

                console.error(
                    "Erreur rÃ©cupÃ©ration rÃ©sultat :",
                    error
                );

                setChargement(false);

            });

        }

    }, [resultat, navigate]);


    /* =========================================================
       COMPATIBILITE METIER
    ========================================================= */

    function afficherCompatibilite(score){

        const pourcentage =
            Math.round((score / 8) * 95);

        let badge = "";
        let couleur = "";

        if(pourcentage >= 85){

            badge = "TrÃ¨s compatible";
            couleur = "#0D1B2A";

        } else if(pourcentage >= 55){

            badge = "Compatible";
            couleur = "#1E3A8A";

        } else {

            badge = "Ã€ explorer";
            couleur = "#98A2B3";
        }

        return {
            pourcentage,
            badge,
            couleur
        };
    }


    /* =========================================================
       PROFILS RIASEC
    ========================================================= */

    const profils = {

        RI: {
            nom: "RÃ©aliste - Investigateur",
            description:
                "Vous aimez comprendre comment les choses fonctionnent, rÃ©soudre des problÃ¨mes et travailler sur des activitÃ©s concrÃ¨tes qui demandent de la rÃ©flexion."
        },

        RA: {
            nom: "RÃ©aliste - Artistique",
            description:
                "Vous combinez votre goÃ»t pour les activitÃ©s concrÃ¨tes avec votre crÃ©ativitÃ© et votre capacitÃ© Ã  imaginer de nouvelles solutions."
        },

        RS: {
            nom: "RÃ©aliste - Social",
            description:
                "Vous apprÃ©ciez les activitÃ©s pratiques tout en accordant une importance particuliÃ¨re Ã  l'aide, Ã  l'accompagnement et au contact avec les autres."
        },

        RE: {
            nom: "RÃ©aliste - Entreprenant",
            description:
                "Vous aimez agir concrÃ¨tement, prendre des initiatives et transformer vos idÃ©es en rÃ©sultats."
        },

        RC: {
            nom: "RÃ©aliste - Conventionnel",
            description:
                "Vous apprÃ©ciez les activitÃ©s pratiques, structurÃ©es et organisÃ©es qui demandent de la prÃ©cision."
        },

        IR: {
            nom: "Investigateur - RÃ©aliste",
            description:
                "Vous aimez analyser les problÃ¨mes tout en recherchant des solutions concrÃ¨tes et applicables."
        },

        IA: {
            nom: "Investigateur - Artistique",
            description:
                "Vous combinez curiositÃ© intellectuelle, rÃ©flexion approfondie et crÃ©ativitÃ©."
        },

        IS: {
            nom: "Investigateur - Social",
            description:
                "Vous aimez comprendre, analyser et utiliser vos connaissances pour aider ou accompagner les autres."
        },

        IE: {
            nom: "Investigateur - Entreprenant",
            description:
                "Vous aimez analyser les situations, dÃ©velopper des stratÃ©gies et prendre des dÃ©cisions."
        },

        IC: {
            nom: "Investigateur - Conventionnel",
            description:
                "Vous apprÃ©ciez l'analyse, la logique, la prÃ©cision et les environnements structurÃ©s."
        },

        AR: {
            nom: "Artistique - RÃ©aliste",
            description:
                "Vous combinez crÃ©ativitÃ© et capacitÃ© Ã  concrÃ©tiser vos idÃ©es."
        },

        AI: {
            nom: "Artistique - Investigateur",
            description:
                "Vous aimez crÃ©er, explorer de nouvelles idÃ©es et comprendre les phÃ©nomÃ¨nes qui vous entourent."
        },

        AS: {
            nom: "Artistique - Social",
            description:
                "Vous Ãªtes attirÃ© par les activitÃ©s crÃ©atives qui permettent Ã©galement d'exprimer votre sensibilitÃ© et de contribuer aux autres."
        },

        AE: {
            nom: "Artistique - Entreprenant",
            description:
                "Vous aimez crÃ©er, convaincre et transformer vos idÃ©es en projets."
        },

        AC: {
            nom: "Artistique - Conventionnel",
            description:
                "Vous combinez crÃ©ativitÃ©, organisation et souci du dÃ©tail."
        },

        SR: {
            nom: "Social - RÃ©aliste",
            description:
                "Vous aimez aider les autres tout en privilÃ©giant les activitÃ©s concrÃ¨tes et pratiques."
        },

        SI: {
            nom: "Social - Investigateur",
            description:
                "Vous Ãªtes attirÃ© par la comprÃ©hension des personnes et par les activitÃ©s permettant d'apporter des solutions."
        },

        SA: {
            nom: "Social - Artistique",
            description:
                "Vous combinez empathie, crÃ©ativitÃ© et intÃ©rÃªt pour les relations humaines."
        },

        SE: {
            nom: "Social - Entreprenant",
            description:
                "Vous aimez travailler avec les autres, prendre des responsabilitÃ©s et mobiliser les personnes autour d'un objectif."
        },

        SC: {
            nom: "Social - Conventionnel",
            description:
                "Vous apprÃ©ciez les environnements organisÃ©s dans lesquels vous pouvez accompagner et aider les autres."
        },

        ER: {
            nom: "Entreprenant - RÃ©aliste",
            description:
                "Vous aimez prendre des initiatives et obtenir des rÃ©sultats concrets."
        },

        EI: {
            nom: "Entreprenant - Investigateur",
            description:
                "Vous combinez esprit d'initiative, analyse et capacitÃ© Ã  prendre des dÃ©cisions."
        },

        EA: {
            nom: "Entreprenant - Artistique",
            description:
                "Vous aimez entreprendre, convaincre et exprimer votre crÃ©ativitÃ©."
        },

        ES: {
            nom: "Entreprenant - Social",
            description:
                "Vous aimez diriger, communiquer et travailler avec les autres pour atteindre des objectifs."
        },

        EC: {
            nom: "Entreprenant - Conventionnel",
            description:
                "Vous apprÃ©ciez la prise de dÃ©cision, l'organisation et les environnements structurÃ©s."
        },

        CR: {
            nom: "Conventionnel - RÃ©aliste",
            description:
                "Vous aimez travailler avec prÃ©cision dans des activitÃ©s concrÃ¨tes et structurÃ©es."
        },

        CI: {
            nom: "Conventionnel - Investigateur",
            description:
                "Vous apprÃ©ciez la logique, l'analyse et les environnements nÃ©cessitant rigueur et organisation."
        },

        CA: {
            nom: "Conventionnel - Artistique",
            description:
                "Vous combinez organisation, prÃ©cision et crÃ©ativitÃ©."
        },

        CS: {
            nom: "Conventionnel - Social",
            description:
                "Vous aimez les environnements organisÃ©s dans lesquels vous pouvez aider et accompagner les autres."
        },

        CE: {
            nom: "Conventionnel - Entreprenant",
            description:
                "Vous combinez organisation, rigueur et capacitÃ© Ã  prendre des initiatives."
        }

    };


    /* =========================================================
       ACTIONS
    ========================================================= */

    const consulterProfil = async () => {

        await enregistrerAction("PROFIL_CONSULTE");

        navigate("/profil-riasec", {
            state: {
                resultat: resultat
            }
        });

    };


    const consulterFormation = async (
        metier,
        resultatActuel
    ) => {

        await enregistrerAction(
            `METIER_CONSULTE: ${metier.nom}`
        );

        await enregistrerAction(
            "FORMATION_CONSULTEE"
        );

        navigate("/formations", {
            state: {
                metier: metier,
                resultat: resultatActuel
            }
        });

    };


    /* =========================================================
       SALAIRE
    ========================================================= */

    function afficherSalaire(min, max){

        return `${Number(min).toLocaleString()} FCFA - ${Number(max).toLocaleString()} FCFA`;

    }


    /* =========================================================
       CHARGEMENT
    ========================================================= */

    if (chargement) {

        return (

            <div className="result-v1-loading-page">

                <div className="result-v1-loading-card">

                    <div className="result-v1-loading-icon">
                        <FaChartBar />
                    </div>

                    <h1>
                        Analyse de votre profil...
                    </h1>

                    <p>
                        NextOri prÃ©pare votre restitution
                        d'orientation personnalisÃ©e.
                    </p>

                    <div className="result-v1-loading-line">
                        <span></span>
                    </div>

                </div>

            </div>

        );

    }


    /* =========================================================
       AUCUN RESULTAT
    ========================================================= */

    if(!resultat){

        return (

            <div className="result-v1-empty-page">

                <div className="result-v1-empty-card">

                    <div className="result-v1-empty-icon">
                        <FaCompass />
                    </div>

                    <h1>
                        Aucun rÃ©sultat disponible
                    </h1>

                    <p>
                        Vous n'avez pas encore effectuÃ©
                        votre test d'orientation.
                    </p>

                    <button
                        className="result-v1-start-test-button"
                        onClick={() => navigate("/test")}
                    >
                        <FaRedo />
                        Faire le test
                        <FaArrowRight />
                    </button>

                </div>

            </div>

        );

    }


    /* =========================================================
       INFORMATIONS DU PROFIL
    ========================================================= */

    const profil = resultat.profil;

    const profilInfo =
        profils[profil.principal] || {

            nom: "Profil RIASEC",

            description:
                "Votre profil professionnel a Ã©tÃ© identifiÃ© selon vos rÃ©ponses."

        };


    const principaux =
        resultat.recommandations?.principaux || [];

    const secondaires =
        resultat.recommandations?.secondaires || [];


    /* =========================================================
       RENDU
    ========================================================= */

    return (

        <div className="result-v1-page">

            {/* =================================================
                CONFETTIS
            ================================================= */}

            {showConfetti && (

                <Confetti
                    numberOfPieces={250}
                    recycle={false}
                    colors={[
                        "#0D1B2A",
                        "#F4B400",
                        "#1E3A8A",
                        "#F2F4F7"
                    ]}
                />

            )}


            {/* =================================================
                HERO
            ================================================= */}

            <header className="result-v1-hero">

                <div className="result-v1-hero-content">

                    <div className="result-v1-success-badge">
                        <FaCheckCircle />
                        Analyse terminÃ©e
                    </div>

                    <p className="result-v1-eyebrow">
                        VOTRE RESTITUTION NEXTORI
                    </p>

                    <h1>
                        Votre avenir commence
                        par une meilleure
                        comprÃ©hension de vous-mÃªme.
                    </h1>

                    <p className="result-v1-hero-description">

                        Nous avons analysÃ© vos rÃ©ponses afin
                        d'identifier vos principales tendances
                        professionnelles et de vous proposer
                        des pistes de carriÃ¨re adaptÃ©es Ã  votre profil.

                    </p>

                    <div className="result-v1-analysis-steps">

                        <div className="result-v1-analysis-step">

                            <span>
                                <FaCheckCircle />
                            </span>

                            <div>
                                <strong>
                                    RÃ©ponses analysÃ©es
                                </strong>

                                <small>
                                    Votre questionnaire a Ã©tÃ© Ã©tudiÃ©.
                                </small>
                            </div>

                        </div>


                        <div className="result-v1-analysis-step">

                            <span>
                                <FaCheckCircle />
                            </span>

                            <div>
                                <strong>
                                    Profil RIASEC identifiÃ©
                                </strong>

                                <small>
                                    Vos principales tendances ont Ã©tÃ© dÃ©terminÃ©es.
                                </small>
                            </div>

                        </div>


                        <div className="result-v1-analysis-step">

                            <span>
                                <FaCheckCircle />
                            </span>

                            <div>
                                <strong>
                                    MÃ©tiers sÃ©lectionnÃ©s
                                </strong>

                                <small>
                                    Les pistes les plus pertinentes ont Ã©tÃ© recherchÃ©es.
                                </small>
                            </div>

                        </div>

                    </div>

                </div>

            </header>


            <main className="result-v1-main">


                {/* =================================================
                    INTRODUCTION
                ================================================= */}

                <section className="result-v1-introduction">

                    <div className="result-v1-section-icon">
                        <FaLightbulb />
                    </div>

                    <div>

                        <span className="result-v1-section-kicker">
                            VOTRE ANALYSE
                        </span>

                        <h2>
                            Nous avons commencÃ© Ã  comprendre
                            ce qui peut vous correspondre.
                        </h2>

                        <p>

                            Votre rÃ©sultat ne se limite pas Ã  une lettre.
                            Il constitue un point de dÃ©part pour mieux
                            comprendre vos centres d'intÃ©rÃªt, vos prÃ©fÃ©rences
                            professionnelles et les environnements dans lesquels
                            vous pourriez vous Ã©panouir.

                        </p>

                    </div>

                </section>


                {/* =================================================
                    PROFIL RIASEC
                ================================================= */}

                <section className="result-v1-profile-result result-v1-premium-result-card">

                    <div className="result-v1-profile-result-top">

                        <div className="result-v1-profile-result-label">
                            <FaCompass />
                            Votre profil professionnel
                        </div>

                        <span className="result-v1-profile-result-number">
                            01
                        </span>

                    </div>


                    <div className="result-v1-profile-result-content">

                        <div className="result-v1-profile-code-wrapper">

                            <span className="result-v1-profile-code-label">
                                PROFIL
                            </span>

                            <div className="result-v1-profile-code">
                                {profil.principal}
                            </div>

                        </div>


                        <div className="result-v1-profile-result-text">

                            <span className="result-v1-profile-introduction">
                                Votre profil dominant
                            </span>

                            <h2>
                                {profilInfo.nom}
                            </h2>

                            <p className="result-v1-profile-description">
                                {profilInfo.description}
                            </p>

                            <p className="result-v1-profile-explication">

                                Ce profil a Ã©tÃ© dÃ©terminÃ© Ã  partir
                                de vos rÃ©ponses au questionnaire RIASEC.
                                Il permet de mettre en Ã©vidence les types
                                d'activitÃ©s et d'environnements professionnels
                                qui correspondent le mieux Ã  vos prÃ©fÃ©rences.

                            </p>

                            <button
                                className="result-v1-profile-button"
                                onClick={consulterProfil}
                            >
                                Comprendre mon profil
                                <FaArrowRight />
                            </button>

                        </div>

                    </div>

                </section>


                {/* =================================================
                    SCORES
                ================================================= */}

                <section className="result-v1-scores-section result-v1-premium-result-card">

                    <div className="result-v1-section-heading">

                        <div>

                            <span className="result-v1-section-kicker">
                                02 Â· VOTRE PROFIL EN CHIFFRES
                            </span>

                            <h2>
                                Ce que vos rÃ©ponses rÃ©vÃ¨lent
                            </h2>

                            <p>
                                Voici la rÃ©partition de vos prÃ©fÃ©rences
                                selon les six dimensions du modÃ¨le RIASEC.
                            </p>

                        </div>

                        <div className="result-v1-section-heading-icon">
                            <FaChartBar />
                        </div>

                    </div>


                    <div className="result-v1-scores-list">

                        {
                            Object.entries(profil.scores)
                                .sort(
                                    ([, scoreA], [, scoreB]) =>
                                        scoreB - scoreA
                                )
                                .map(
                                    ([lettre, score]) => {

                                        const pourcentage =
                                            Math.round(
                                                (Number(score) / 10) * 100
                                            );

                                        return (

                                            <div
                                                className="result-v1-score-item"
                                                key={lettre}
                                            >

                                                <div className="result-v1-score-header">

                                                    <div className="result-v1-score-letter">
                                                        {lettre}
                                                    </div>

                                                    <strong>
                                                        {pourcentage}%
                                                    </strong>

                                                </div>

                                                <div className="result-v1-score-bar">

                                                    <div
                                                        className="result-v1-score-progress"
                                                        style={{
                                                            width:
                                                                `${pourcentage}%`
                                                        }}
                                                    />

                                                </div>

                                            </div>

                                        );

                                    }
                                )
                        }

                    </div>


                    <div className="result-v1-scores-conclusion">

                        <FaBullseye />

                        <p>

                            Vos tendances les plus fortes permettent
                            Ã  NextOri d'affiner les recommandations
                            professionnelles prÃ©sentÃ©es ci-dessous.

                        </p>

                    </div>

                </section>


                {/* =================================================
                    EXPLICATION DE L'ANALYSE
                ================================================= */}

                <section className="result-v1-analysis-explanation">

                    <div className="result-v1-analysis-explanation-icon">
                        <FaSearch />
                    </div>

                    <div>

                        <span className="result-v1-section-kicker">
                            COMMENT LIRE VOTRE RÃ‰SULTAT ?
                        </span>

                        <h2>
                            Votre profil devient maintenant
                            une direction.
                        </h2>

                        <p>

                            Nous avons croisÃ© votre profil avec les
                            caractÃ©ristiques des mÃ©tiers disponibles
                            dans NextOri afin d'identifier les pistes
                            prÃ©sentant la meilleure correspondance.

                        </p>

                    </div>

                </section>


                {/* =================================================
                    METIERS
                ================================================= */}

                <section className="result-v1-jobs-section">


                    <div className="result-v1-jobs-section-header">

                        <div>

                            <span className="result-v1-section-kicker">
                                03 Â· VOS OPPORTUNITÃ‰S
                            </span>

                            <h2>
                                Les mÃ©tiers qui vous correspondent
                                le mieux
                            </h2>

                            <p>

                                Ã€ partir de votre profil, nous avons
                                sÃ©lectionnÃ© les carriÃ¨res qui prÃ©sentent
                                les meilleures correspondances.

                            </p>

                        </div>

                        <div className="result-v1-jobs-section-icon">
                            <FaTrophy />
                        </div>

                    </div>


                    {/* =================================================
                        METIERS PRINCIPAUX
                    ================================================= */}

                    <div className="result-v1-recommendation-category">

                        <div className="result-v1-category-title-wrapper">

                            <div className="result-v1-category-title-icon">
                                <FaTrophy />
                            </div>

                            <div>

                                <span>
                                    PRIORITÃ‰
                                </span>

                                <h3>
                                    Vos recommandations principales
                                </h3>

                                <p>
                                    Les pistes prÃ©sentant la plus forte
                                    compatibilitÃ© avec votre profil.
                                </p>

                            </div>

                        </div>


                        <div className="result-v1-jobs-list">

                            {

                                principaux.map((metier, index) => {

                                    const compatibilite =
                                        afficherCompatibilite(
                                            metier.score_compatibilite
                                        );

                                    return (

                                        <article
                                            className="result-v1-job-card result-v1-premium-job-card"
                                            key={metier.id_metier}
                                        >

                                            <div className="result-v1-job-rank">
                                                0{index + 1}
                                            </div>


                                            <div className="result-v1-job-header">

                                                <div className="result-v1-job-title-area">

                                                    <span className="result-v1-job-recommendation-label">
                                                        MÃ‰TIER RECOMMANDÃ‰
                                                    </span>

                                                    <h3>
                                                        {metier.nom}
                                                    </h3>

                                                </div>


                                                <div
                                                    className="result-v1-compatibilite"
                                                    style={{
                                                        backgroundColor:
                                                            compatibilite.couleur
                                                    }}
                                                >

                                                    <span>
                                                        {compatibilite.badge}
                                                    </span>

                                                    <strong>
                                                        {compatibilite.pourcentage}%
                                                    </strong>

                                                </div>

                                            </div>


                                            <div className="result-v1-job-description-box">

                                                <FaFileAlt />

                                                <p>
                                                    {metier.description}
                                                </p>

                                            </div>


                                            <div className="result-v1-job-information">

                                                <p>

                                                    <FaFolderOpen />

                                                    <strong>
                                                        Secteur :
                                                    </strong>

                                                    <span>
                                                        {metier.secteur}
                                                    </span>

                                                </p>


                                                <p>

                                                    <FaGraduationCap />

                                                    <strong>
                                                        Niveau d'Ã©tude :
                                                    </strong>

                                                    <span>
                                                        {metier.niveau_etude}
                                                    </span>

                                                </p>


                                                <p>

                                                    <FaMoneyBillWave />

                                                    <strong>
                                                        Salaire :
                                                    </strong>

                                                    <span>
                                                        {afficherSalaire(
                                                            metier.salaire_min,
                                                            metier.salaire_max
                                                        )}
                                                    </span>

                                                </p>

                                            </div>


                                            <div className="result-v1-job-footer">

                                                <span>
                                                    DÃ©couvrez le parcours
                                                    pour accÃ©der Ã  ce mÃ©tier.
                                                </span>

                                                <button
                                                    className="result-v1-job-button"
                                                    onClick={() =>
                                                        consulterFormation(
                                                            metier,
                                                            resultat
                                                        )
                                                    }
                                                >

                                                    Explorer cette carriÃ¨re

                                                    <FaArrowRight />

                                                </button>

                                            </div>

                                        </article>

                                    );

                                })

                            }

                        </div>

                    </div>


                    {/* =================================================
                        METIERS SECONDAIRES
                    ================================================= */}

                    <div className="result-v1-recommendation-category result-v1-secondary-category">

                        <div className="result-v1-category-title-wrapper">

                            <div className="result-v1-category-title-icon">
                                <FaStar />
                            </div>

                            <div>

                                <span>
                                    Ã€ EXPLORER
                                </span>

                                <h3>
                                    D'autres pistes pourraient vous correspondre
                                </h3>

                                <p>
                                    Des alternatives intÃ©ressantes Ã  considÃ©rer
                                    dans votre exploration professionnelle.
                                </p>

                            </div>

                        </div>


                        {

                            secondaires.length > 0 ? (

                                <div className="result-v1-jobs-list">

                                    {

                                        secondaires.map((metier) => {

                                            const compatibilite =
                                                afficherCompatibilite(
                                                    metier.score_compatibilite
                                                );

                                            return (

                                                <article
                                                    className="result-v1-job-card result-v1-secondary-card"
                                                    key={metier.id_metier}
                                                >

                                                    <div className="result-v1-job-header">

                                                        <div className="result-v1-job-title-area">

                                                            <span className="result-v1-job-recommendation-label">
                                                                PISTE Ã€ EXPLORER
                                                            </span>

                                                            <h3>
                                                                {metier.nom}
                                                            </h3>

                                                        </div>


                                                        <div
                                                            className="result-v1-compatibilite"
                                                            style={{
                                                                backgroundColor:
                                                                    compatibilite.couleur
                                                            }}
                                                        >

                                                            <span>
                                                                {compatibilite.badge}
                                                            </span>

                                                            <strong>
                                                                {compatibilite.pourcentage}%
                                                            </strong>

                                                        </div>

                                                    </div>


                                                    <div className="result-v1-job-description-box">

                                                        <FaFileAlt />

                                                        <p>
                                                            {metier.description}
                                                        </p>

                                                    </div>


                                                    <div className="result-v1-job-information">

                                                        <p>

                                                            <FaFolderOpen />

                                                            <strong>
                                                                Secteur :
                                                            </strong>

                                                            <span>
                                                                {metier.secteur}
                                                            </span>

                                                        </p>


                                                        <p>

                                                            <FaGraduationCap />

                                                            <strong>
                                                                Niveau d'Ã©tude :
                                                            </strong>

                                                            <span>
                                                                {metier.niveau_etude}
                                                            </span>

                                                        </p>


                                                        <p>

                                                            <FaMoneyBillWave />

                                                            <strong>
                                                                Salaire :
                                                            </strong>

                                                            <span>
                                                                {afficherSalaire(
                                                                    metier.salaire_min,
                                                                    metier.salaire_max
                                                                )}
                                                            </span>

                                                        </p>

                                                    </div>


                                                    <div className="result-v1-job-footer">

                                                        <span>
                                                            Cette piste mÃ©rite
                                                            Ã©galement votre attention.
                                                        </span>

                                                        <button
                                                            className="result-v1-job-button"
                                                            onClick={() =>
                                                                consulterFormation(
                                                                    metier,
                                                                    resultat
                                                                )
                                                            }
                                                        >

                                                            Explorer cette carriÃ¨re

                                                            <FaArrowRight />

                                                        </button>

                                                    </div>

                                                </article>

                                            );

                                        })

                                    }

                                </div>

                            ) : (

                                <div className="result-v1-no-secondary">

                                    <FaCompass />

                                    <h3>
                                        Continuons votre exploration
                                    </h3>

                                    <p>
                                        Aucun mÃ©tier secondaire n'a Ã©tÃ© identifiÃ©
                                        pour votre profil.
                                    </p>

                                    <span>
                                        Les recommandations principales
                                        constituent vos meilleures pistes actuelles.
                                    </span>

                                </div>

                            )

                        }

                    </div>

                </section>


                {/* =================================================
                    TRANSITION VERS LES FORMATIONS
                ================================================= */}

                <section className="result-v1-next-step-section">

                    <div className="result-v1-next-step-content">

                        <div className="result-v1-next-step-number">
                            04
                        </div>

                        <div className="result-v1-next-step-icon">
                            <FaGraduationCap />
                        </div>

                        <span className="result-v1-section-kicker">
                            PROCHAINE Ã‰TAPE
                        </span>

                        <h2>
                            Un mÃ©tier vous intÃ©resse ?
                            DÃ©couvrez maintenant comment y accÃ©der.
                        </h2>

                        <p>

                            Votre rÃ©sultat vous donne une direction.
                            NextOri peut maintenant vous guider vers les
                            formations et les Ã©tablissements qui peuvent
                            vous rapprocher des carriÃ¨res qui vous intÃ©ressent.

                        </p>


                        <div className="result-v1-orientation-path">

                            <div className="result-v1-orientation-step">

                                <span>
                                    01
                                </span>

                                <FaBullseye />

                                <strong>
                                    Votre profil
                                </strong>

                            </div>


                            <FaArrowRight className="result-v1-orientation-arrow" />


                            <div className="result-v1-orientation-step">

                                <span>
                                    02
                                </span>

                                <FaBriefcaseIconFallback />

                                <strong>
                                    Votre mÃ©tier
                                </strong>

                            </div>


                            <FaArrowRight className="result-v1-orientation-arrow" />


                            <div className="result-v1-orientation-step">

                                <span>
                                    03
                                </span>

                                <FaGraduationCap />

                                <strong>
                                    Votre formation
                                </strong>

                            </div>


                            <FaArrowRight className="result-v1-orientation-arrow" />


                            <div className="result-v1-orientation-step">

                                <span>
                                    04
                                </span>

                                <FaUniversity />

                                <strong>
                                    Votre Ã©tablissement
                                </strong>

                            </div>

                        </div>

                    </div>

                </section>


                {/* =================================================
                    MESSAGE FINAL
                ================================================= */}

                <section className="result-v1-final-message">

                    <div className="result-v1-final-icon">
                        <FaCompass />
                    </div>

                    <span className="result-v1-section-kicker">
                        VOTRE PARCOURS NEXTORI
                    </span>

                    <h2>
                        Votre rÃ©sultat est une premiÃ¨re direction,
                        pas une destination.
                    </h2>

                    <p>

                        Prenez le temps d'explorer les mÃ©tiers proposÃ©s,
                        de comprendre les formations nÃ©cessaires et de
                        comparer les Ã©tablissements. Votre orientation
                        se construit Ã©tape par Ã©tape.

                    </p>

                </section>


                {/* =================================================
                    ACTIONS FINALES
                ================================================= */}

                <section className="result-v1-actions-section">

                    <div className="result-v1-actions-heading">

                        <span className="result-v1-section-kicker">
                            CONTINUEZ VOTRE EXPLORATION
                        </span>

                        <h2>
                            Que souhaitez-vous faire maintenant ?
                        </h2>

                    </div>


                    <div className="result-v1-actions">

                        <button
                            className="result-v1-retry-button"
                            onClick={() => navigate("/test")}
                        >

                            <FaRedo />

                            Refaire le test

                        </button>


                        <button
                            className="result-v1-home-button"
                            onClick={() => navigate("/dashboard")}
                        >

                            <FaHome />

                            Retour Ã  l'accueil

                        </button>

                    </div>

                </section>


            </main>

        </div>

    );

}


/* =============================================================
   ICÃ”NE DE SECOURS POUR LE PARCOURS
   On utilise une petite icÃ´ne inline pour Ã©viter d'ajouter
   une dÃ©pendance ou de modifier le fonctionnement existant.
============================================================= */

function FaBriefcaseIconFallback(){

    return (
        <FaFolderOpen />
    );

}


export default Result;
