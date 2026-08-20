import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

import "../styles/HistoriqueTests.css";
import FooterNavigation from "../components/FooterNavigation";

function HistoriqueTests() {

    const navigate = useNavigate();

    const [tests, setTests] = useState([]);
    const [chargement, setChargement] = useState(true);
    const [erreur, setErreur] = useState("");

    useEffect(() => {

        fetch(
            "http://localhost/NextOri/backend/api/routes/historique-tests.php",
            {
                credentials: "include"
            }
        )
            .then(async (response) => {

                const data = await response.json();

                if (!response.ok) {
                    throw new Error(
                        data.message || "Erreur lors de la récupération."
                    );
                }

                return data;
            })
            .then((data) => {

                if (data.success) {

                    setTests(data.data || []);

                } else {

                    setErreur(
                        data.message || "Impossible de récupérer l'historique."
                    );

                }

            })
            .catch((error) => {

                console.error(
                    "Erreur historique tests :",
                    error
                );

                setErreur(
                    "Impossible de charger votre historique."
                );

            })
            .finally(() => {

                setChargement(false);

            });

    }, []);


    if (chargement) {

        return (
            <div className="historique-tests-page">

                <h2>
                    Chargement de votre historique...
                </h2>

            </div>
        );

    }


    if (erreur) {

        return (
            <div className="historique-tests-page">

                <h2>
                    Historique des tests
                </h2>

                <p className="historique-error">
                    {erreur}
                </p>

            </div>
        );

    }


    return (

        <div className="historique-tests-page">

            <header className="historique-tests-header">

                <div>

                    <h1>
                        📋 Historique de mes tests
                    </h1>

                    <p>
                        Retrouvez tous les tests d'orientation
                        que vous avez effectués.
                    </p>

                </div>


                <div className="historique-tests-count">

                    <strong>
                        {tests.length}
                    </strong>

                    <span>
                        test{tests.length > 1 ? "s" : ""} effectué{tests.length > 1 ? "s" : ""}
                    </span>

                </div>

            </header>


            {tests.length === 0 ? (

                <div className="historique-tests-empty">

                    <h2>
                        Aucun test effectué
                    </h2>

                    <p>
                        Vous n'avez pas encore effectué de test
                        d'orientation.
                    </p>

                    <button
                        onClick={() => navigate("/test")}
                    >
                        Faire mon premier test
                    </button>

                </div>

            ) : (

                <section className="historique-tests-list">

                    {tests.map((test, index) => {
                        const numeroTest = tests.length - index;
                        return (

                        <article
                            key={test.id_test}
                            className="historique-test-card"
                        >

                            <div className="historique-test-top">

                                <div>

                                    <h2>
                                        Test d'orientation
                                    </h2>

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


                                <span className="historique-test-profil">

                                    {test.profil_dominant}

                                </span>

                            </div>


                            <div className="historique-test-scores">

                                <div>
                                    <span>R</span>
                                    <strong>{test.score_R}</strong>
                                </div>

                                <div>
                                    <span>I</span>
                                    <strong>{test.score_I}</strong>
                                </div>

                                <div>
                                    <span>A</span>
                                    <strong>{test.score_A}</strong>
                                </div>

                                <div>
                                    <span>S</span>
                                    <strong>{test.score_S}</strong>
                                </div>

                                <div>
                                    <span>E</span>
                                    <strong>{test.score_E}</strong>
                                </div>

                                <div>
                                    <span>C</span>
                                    <strong>{test.score_C}</strong>
                                </div>

                            </div>


                            <div className="historique-test-footer">

                                <span>
                                    Test #{numeroTest}
                                </span>


                                <button
                                    onClick={() => {

                                        navigate(
                                            `/resultat-test/${test.id_test}`
                                        );

                                    }}
                                >
                                    Voir mon résultat →
                                </button>

                            </div>

                        </article>

                    ); 
                    })}

                </section>

            )}


            <button
                className="historique-retour-button"
                onClick={() => navigate("/profil")}
            >
                ← Retour au profil
            </button>

            <FooterNavigation />

        </div>

    );

}

export default HistoriqueTests;