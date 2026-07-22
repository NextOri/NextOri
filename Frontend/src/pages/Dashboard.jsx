import "./../styles/Dashboard.css";

import FooterNavigation from "../components/FooterNavigation";

import { useNavigate } from "react-router-dom";

import { useEffect, useState } from "react";

function Dashboard() {

    const navigate = useNavigate();

    const [aDejaTeste, setADejaTeste] = useState(false);

    useEffect(() => {

     fetch("http://localhost/NextOri/backend/api/routes/resultats.php?id_user=1")
        .then(response => response.json())
        .then(data => {

            if (data.success) {
                setADejaTeste(true);
            }

        })
        .catch(error => {

            console.error(
                "Erreur récupération résultat :",
                error
            );

        });

      }, []);

    return (

        <div className="dashboard-page">

            {/* HEADER */}

            <section className="dashboard-header">

                <p className="dashboard-subtitle">

                    Tableau de bord

                </p>

                <h1>

                    Next<span>Ori</span>

                </h1>

            </section>



            {/* NIVEAU */}

           <section className="level-card">

    <div className="level-header">

        <h2>Explorateur</h2>

        <span>Niveau 1</span>

    </div>

    <div className="progress-bar">

        <div className="progress-fill"></div>

    </div>

    <p className="progress-text">

        Progression : 60%

    </p>

</section>



            {/* STATISTIQUES */}

            <section className="statistics-section">

    <div className="stat-card">

        <h3>⭐</h3>

        <h2>120</h2>

        <p>Points</p>

    </div>

    <div className="stat-card">

        <h3>🔥</h3>

        <h2>7</h2>

        <p>Jours</p>

    </div>

    <div className="stat-card">

        <h3>🏅</h3>

        <h2>3</h2>

        <p>Badges</p>

    </div>

</section>



            {/* BIENVENUE */}

            <section className="welcome-card">

    <h2>
        Bienvenue sur NextOri 👋
    </h2>

    <p>
        Construisez votre avenir en découvrant les métiers,
        formations et universités qui correspondent à votre profil.
    </p>

    <button className="primary-dashboard-button">

        Commencer mon parcours

    </button>

</section>



            {/* PARCOURS */}
                <section className="orientation-path">

    <h2>
        Mon parcours d'orientation
    </h2>


    <div className="path-container">


        <div className="path-item completed">

            <div className="path-circle">
                ✓
            </div>

            <div>

                <h3>
                    Créer mon profil
                </h3>

                <p>
                    Informations personnelles complétées
                </p>

            </div>

        </div>



        <div className="path-item completed">

            <div className="path-circle">
                ✓
            </div>

            <div>

                <h3>
                    Passer le test RIASEC
                </h3>

                <p>
                    Découvrir ses intérêts professionnels
                </p>

            </div>

        </div>



        <div className="path-item active">

            <div className="path-circle">
                3
            </div>

            <div>

                <h3>
                    Découvrir mon profil
                </h3>

                <p>
                    Analyser mes résultats
                </p>

            </div>

        </div>



        <div className="path-item">

            <div className="path-circle">
                4
            </div>

            <div>

                <h3>
                    Explorer les métiers
                </h3>

                <p>
                    Trouver les carrières adaptées
                </p>

            </div>

        </div>



        <div className="path-item">

            <div className="path-circle">
                5
            </div>

            <div>

                <h3>
                    Choisir une formation
                </h3>

                <p>
                    Découvrir les filières
                </p>

            </div>

        </div>



        <div className="path-item">

            <div className="path-circle">
                6
            </div>

            <div>

                <h3>
                    Trouver une université
                </h3>

                <p>
                    Explorer les établissements
                </p>

            </div>

        </div>


    </div>

</section>


            {/* ACTIONS RAPIDES */}

            <section className="quick-actions">


    <h2>

        Explorer NextOri

    </h2>



    <div className="actions-grid">


        <div className="action-card">

            <span>🧪</span>

            <h3>Test RIASEC</h3>

            <p>
                Découvrez votre profil.
            </p>

        </div>



        <div className="action-card">

            <span>💼</span>

            <h3>Métiers</h3>

            <p>
                Explorez les carrières.
            </p>

        </div>



        <div className="action-card">

            <span>🎓</span>

            <h3>Formations</h3>

            <p>
                Trouvez une filière.
            </p>

        </div>



        <div className="action-card">

            <span>🏛</span>

            <h3>Universités</h3>

            <p>
                Découvrez les établissements.
            </p>

        </div>


    </div>


</section>
 
       {/* BOUTON */}

      <section className="action-button-section">

    <h2>
        Passez à l'action 🚀
    </h2>

    <p>
        Découvrez votre profil d'orientation
        et construisez votre avenir professionnel.
    </p>


  <button
    className="start-test-button"
    onClick={() =>
        aDejaTeste
            ? navigate("/result")
            : navigate("/test")
    }
>
    {aDejaTeste
        ? "Voir mes résultats"
        : "Commencer le test"}
  </button>

</section>

            {/* PROJET */}

            <section className="project-card">

    <h2>
        Mon projet d'avenir 🚀
    </h2>


    <p>
        Construisez progressivement votre projet
        professionnel grâce aux recommandations NextOri.
    </p>


    <div className="project-steps">


        <div className="project-step">

            <span>1</span>

            <p>
                Découvrir mes métiers
            </p>

        </div>



        <div className="project-step">

            <span>2</span>

            <p>
                Choisir une formation
            </p>

        </div>



        <div className="project-step">

            <span>3</span>

            <p>
                Trouver une université
            </p>

        </div>


    </div>


</section>



            {/* BESOIN D'AIDE */}

           <section className="help-card">


    <h2>

        Besoin d'aide ?

    </h2>


    <p>

        Nos conseillers en orientation seront bientôt
        disponibles pour vous accompagner.

    </p>


    <button className="help-button">

        En savoir plus

    </button>


</section>



            {/* FOOTER */}

            <FooterNavigation />

        </div>

    );

}

export default Dashboard;