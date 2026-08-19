import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";

import "../styles/ResultatHistorique.css";

function ResultatHistorique() {

    const { id_test } = useParams();
    const navigate = useNavigate();

    const [test, setTest] = useState(null);
    const [chargement, setChargement] = useState(true);
    const [erreur, setErreur] = useState("");

    useEffect(() => {

        fetch(
            `http://localhost/NextOri/backend/api/routes/historique-test-detail.php?id_test=${id_test}`,
            {
                credentials: "include"
            }
        )
            .then(async (response) => {

                const data = await response.json();

                if (!response.ok) {

                    throw new Error(
                        data.message ||
                        "Erreur lors de la récupération du test."
                    );

                }

                return data;

            })
            .then((data) => {

                if (data.success) {

                    setTest(data.data);

                } else {

                    setErreur(
                        data.message ||
                        "Test introuvable."
                    );

                }

            })
            .catch((error) => {

                console.error(
                    "Erreur résultat historique :",
                    error
                );

                setErreur(
                    "Impossible de récupérer ce test."
                );

            })
            .finally(() => {

                setChargement(false);

            });

    }, [id_test]);


    if (chargement) {

        return (
            <div className="resultat-historique-page">

                <h2>
                    Chargement du résultat...
                </h2>

            </div>
        );

    }


    if (erreur || !test) {

        return (
            <div className="resultat-historique-page">

                <h2>
                    Résultat introuvable
                </h2>

                <p>
                    {erreur}
                </p>

                <button
                    onClick={() =>
                        navigate("/historique-tests")
                    }
                >
                    ← Retour à mon historique
                </button>

            </div>
        );

    }


    const profils = {

        RI: {
            nom: "Réaliste • Investigateur",
            description:
                "Vous aimez résoudre des problèmes concrets grâce à l'observation, la logique et les activités techniques."
        },

        RA: {
            nom: "Réaliste • Artistique",
            description:
                "Vous aimez créer, construire et transformer des idées en réalisations concrètes."
        },

        RS: {
            nom: "Réaliste • Social",
            description:
                "Vous appréciez les activités pratiques tout en aidant les autres."
        },

        RE: {
            nom: "Réaliste • Entreprenant",
            description:
                "Vous aimez agir, diriger et relever des défis concrets."
        },

        RC: {
            nom: "Réaliste • Conventionnel",
            description:
                "Vous êtes organisé, méthodique et aimez les activités pratiques."
        },

        IR: {
            nom: "Investigateur • Réaliste",
            description:
                "Vous aimez comprendre, expérimenter et résoudre des problèmes."
        },

        IA: {
            nom: "Investigateur • Artistique",
            description:
                "Vous combinez créativité et esprit scientifique."
        },

        IS: {
            nom: "Investigateur • Social",
            description:
                "Vous aimez analyser et transmettre vos connaissances."
        },

        IE: {
            nom: "Investigateur • Entreprenant",
            description:
                "Vous aimez innover et porter des projets ambitieux."
        },

        IC: {
            nom: "Investigateur • Conventionnel",
            description:
                "Vous êtes rigoureux et aimez les activités intellectuelles."
        },

        AR: {
            nom: "Artistique • Réaliste",
            description:
                "Vous aimez créer avec des réalisations concrètes."
        },

        AI: {
            nom: "Artistique • Investigateur",
            description:
                "Vous aimez créer tout en recherchant des solutions nouvelles."
        },

        AS: {
            nom: "Artistique • Social",
            description:
                "Vous aimez exprimer votre créativité au service des autres."
        },

        AE: {
            nom: "Artistique • Entreprenant",
            description:
                "Vous aimez innover, convaincre et entreprendre."
        },

        AC: {
            nom: "Artistique • Conventionnel",
            description:
                "Vous savez allier créativité et organisation."
        },

        SR: {
            nom: "Social • Réaliste",
            description:
                "Vous aimez aider les autres à travers des actions concrètes."
        },

        SI: {
            nom: "Social • Investigateur",
            description:
                "Vous aimez comprendre les personnes et les accompagner."
        },

        SA: {
            nom: "Social • Artistique",
            description:
                "Vous aimez transmettre et créer des liens."
        },

        SE: {
            nom: "Social • Entreprenant",
            description:
                "Vous aimez diriger des équipes et accompagner les personnes."
        },

        SC: {
            nom: "Social • Conventionnel",
            description:
                "Vous êtes organisé et aimez travailler avec les autres."
        },

        ER: {
            nom: "Entreprenant • Réaliste",
            description:
                "Vous aimez prendre des décisions et agir."
        },

        EI: {
            nom: "Entreprenant • Investigateur",
            description:
                "Vous aimez innover et développer de nouveaux projets."
        },

        EA: {
            nom: "Entreprenant • Artistique",
            description:
                "Vous aimez créer et convaincre."
        },

        ES: {
            nom: "Entreprenant • Social",
            description:
                "Vous aimez diriger, communiquer et motiver les autres."
        },

        EC: {
            nom: "Entreprenant • Conventionnel",
            description:
                "Vous aimez gérer et organiser."
        },

        CR: {
            nom: "Conventionnel • Réaliste",
            description:
                "Vous êtes méthodique et aimez les tâches concrètes."
        },

        CI: {
            nom: "Conventionnel • Investigateur",
            description:
                "Vous aimez analyser avec précision."
        },

        CA: {
            nom: "Conventionnel • Artistique",
            description:
                "Vous aimez organiser des projets créatifs."
        },

        CS: {
            nom: "Conventionnel • Social",
            description:
                "Vous aimez organiser le travail d'équipe."
        },

        CE: {
            nom: "Conventionnel • Entreprenant",
            description:
                "Vous aimez gérer, planifier et diriger."
        }

    };


    /*
     * Le backend retourne maintenant :
     *
     * test.profil.principal
     * test.profil.scores
     * test.recommandations.principaux
     * test.recommandations.secondaires
     */

    const profilPrincipal =
        test.profil?.principal ||
        test.profil_dominant ||
        "";

    const profilInfo =
        profils[profilPrincipal] || {

            nom: "Profil RIASEC",

            description:
                "Votre profil professionnel a été identifié selon vos réponses."

        };


    const scores = [

        {
            lettre: "R",
            nom: "Réaliste",
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

    ];


    const metiersPrincipaux =
        test.recommandations?.principaux || [];

    const metiersSecondaires =
        test.recommandations?.secondaires || [];


    /*
     * Affiche les formations associées à un métier.
     */
    const afficherFormations = (metier) => {

        const formations = metier.filieres || [];

        if (formations.length === 0) {

            return (
                <p>
                    Aucune formation trouvée pour ce métier.
                </p>
            );

        }

        return (

            <div className="resultat-historique-formations">

                {formations.map((formation, index) => {

                    const filiere =
                        formation.filiere;

                    const universites =
                        formation.universites || [];


                    return (

                        <div
                            key={
                                filiere?.id_filiere ||
                                index
                            }
                            className="resultat-historique-formation"
                        >

                            <div>

                                <h4>
                                    🎓 {filiere?.nom}
                                </h4>

                                <p>
                                    🏷 Domaine :{" "}
                                    {filiere?.domaine}
                                </p>

                                <p>
                                    ⏳ Durée :{" "}
                                    {filiere?.duree}
                                </p>

                            </div>


                            {universites.length > 0 && (

                                <div className="resultat-historique-universites">

                                    <h5>
                                        🏫 Universités
                                    </h5>

                                    {universites.map(
                                        (
                                            universite,
                                            universiteIndex
                                        ) => (

                                            <button
                                                key={
                                                    universite.id_universite ||
                                                    universiteIndex
                                                }
                                                onClick={() =>
                                                    navigate(
                                                        `/universite-catalogue/${universite.id_universite}`
                                                    )
                                                }
                                            >
                                                {universite.nom}
                                            </button>

                                        )
                                    )}

                                </div>

                            )}

                        </div>

                    );

                })}

            </div>

        );

    };


    /*
     * Affiche les métiers.
     */
    const afficherMetiers = (
        metiers,
        type
    ) => {

        if (metiers.length === 0) {

            return (

                <p>
                    Aucune recommandation disponible.
                </p>

            );

        }


        return (

            <div className="resultat-historique-metiers">

                {metiers.map((metier, index) => (

                    <article
                        key={
                            metier.id_metier ||
                            metier.id_metier_riasec ||
                            index
                        }
                        className="resultat-historique-metier"
                    >

                        <div className="resultat-historique-metier-header">

                            <div>

                                <span>
                                    {type === "principal"
                                        ? "⭐ Métier recommandé"
                                        : "💡 Autre piste"
                                    }
                                </span>

                                <h3>
                                    {metier.nom}
                                </h3>

                            </div>

                        </div>


                        {metier.description && (

                            <p>
                                {metier.description}
                            </p>

                        )}


                        {afficherFormations(metier)}

                    </article>

                ))}

            </div>

        );

    };


    return (

        <div className="resultat-historique-page">


            <header className="resultat-historique-header">

                <div>

                    <h1>
                        📊 Résultat de mon test
                    </h1>

                    <p>

                        Test effectué le{" "}

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


                <span className="resultat-historique-test-id">

                    Test #{test.id_test}

                </span>

            </header>


            <section className="resultat-historique-profil">

                <p>
                    Votre profil dominant
                </p>

                <div className="resultat-historique-code">

                    {profilPrincipal}

                </div>

                <h2>
                    {profilInfo.nom}
                </h2>

                <p>
                    {profilInfo.description}
                </p>

            </section>


            <section className="resultat-historique-scores">

                <h2>
                    Vos scores RIASEC
                </h2>

                <div className="resultat-scores-list">

                    {scores.map((score) => (

                        <div
                            className="resultat-score-item"
                            key={score.lettre}
                        >

                            <div className="resultat-score-header">

                                <span>
                                    {score.lettre}
                                </span>

                                <strong>
                                    {score.nom}
                                </strong>

                                <b>
                                    {score.score}
                                </b>

                            </div>


                            <div className="resultat-score-bar">

                                <div
                                    className="resultat-score-progress"
                                    style={{
                                        width:
                                            `${Math.min(
                                                (Number(score.score) / 20) * 100,
                                                100
                                            )}%`
                                    }}
                                />

                            </div>

                        </div>

                    ))}

                </div>

            </section>


            <section className="resultat-historique-recommandations">

                <div className="resultat-historique-section-header">

                    <div>

                        <span>
                            🎯 Votre orientation
                        </span>

                        <h2>
                            Métiers recommandés
                        </h2>

                    </div>

                </div>


                <div>

                    <h3>
                        ⭐ Métiers principaux
                    </h3>

                    {afficherMetiers(
                        metiersPrincipaux,
                        "principal"
                    )}

                </div>


                <div>

                    <h3>
                        💡 Métiers secondaires
                    </h3>

                    {afficherMetiers(
                        metiersSecondaires,
                        "secondaire"
                    )}

                </div>

            </section>


            <div className="resultat-historique-actions">

                <button
                    onClick={() =>
                        navigate("/historique-tests")
                    }
                >
                    ← Retour à mon historique
                </button>


                <button
                    onClick={() =>
                        navigate("/test")
                    }
                >
                    Refaire un test
                </button>

            </div>


        </div>

    );

}

export default ResultatHistorique;