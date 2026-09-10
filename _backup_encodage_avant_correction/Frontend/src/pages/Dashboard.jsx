import { API_ROUTES_URL } from "../config/api";
import "./../styles/Dashboard.css";

import FooterNavigation from "../components/FooterNavigation";

import OrientationNotification from "../components/OrientationNotification";

import Footer from "../components/Footer";

import { useNavigate } from "react-router-dom";

import { useEffect, useState } from "react";

import {
    Star,
    Flame,
    Award,
    Medal,
    Hand,
    FlaskConical,
    BriefcaseBusiness,
    GraduationCap,
    Landmark,
    Compass,
    Rocket,
    MessageCircle,
    Bell,
    UserRound,
     Target,
     Brain,
     MessageSquare,
    Check
} from "lucide-react";


function Dashboard() {

    const navigate = useNavigate();

    const [aDejaTeste, setADejaTeste] = useState(false);

const [dashboardDataState, setDashboardDataState] = useState(null);

const [chargementDashboard, setChargementDashboard] = useState(true);

const [chargementNotification, setChargementNotification] = useState(false);

const [messageNotification, setMessageNotification] = useState("");

const [typeNotification, setTypeNotification] = useState("");

    useEffect(() => {

    fetch(
     `${API_ROUTES_URL}/resultats.php`,
    {
        credentials: "include"
    }
    )
         
        .then(response => response.json())
        .then(data => {

            if (data.success) {
                setADejaTeste(true);
            }

        })
        .catch(error => {

            console.error(
                "Erreur rÃ©cupÃ©ration rÃ©sultat :",
                error
            );

        });

      }, []);

      useEffect(() => {

    fetch(
    `${API_ROUTES_URL}/dashboard.php`,
    {
        credentials: "include"
    }
   )
    .then(async response => {

        const data = await response.json();

        if (response.status === 401) {
            localStorage.removeItem("utilisateur");
            navigate("/connexion", { replace: true });
            return null;
        }

        return data;

    })
    .then(data => {

        if (!data) {
            return;
        }

        if (data.success) {
            setDashboardDataState(data.data);
        }

        setChargementDashboard(false);

    })

    .catch(error => {

        console.error(
            "Erreur Dashboard :",
            error
        );

        setChargementDashboard(false);

    });

}, []);
  



   if(chargementDashboard){

    return <p>Chargement du tableau de bord...</p>;

 }
   const parcours = [

    {
        numero: 1,
        titre: "CrÃ©er mon profil",
        description: "Informations personnelles complÃ©tÃ©es",
        termine: dashboardDataState.parcours.profil
    },

    {
        numero: 2,
        titre: "Passer le test RIASEC",
        description: "DÃ©couvrir ses intÃ©rÃªts professionnels",
        termine: dashboardDataState.parcours.test
    },

    {
        numero: 3,
        titre: "DÃ©couvrir mon profil",
        description: "Analyser mes rÃ©sultats",
        termine: dashboardDataState.parcours.profilConsulte
    },

    {
        numero: 4,
        titre: "Explorer les mÃ©tiers",
        description: "Trouver les carriÃ¨res adaptÃ©es",
        termine: dashboardDataState.parcours.metiersConsultes
    },

    {
        numero: 5,
        titre: "Choisir une formation",
        description: "DÃ©couvrir les filiÃ¨res",
        termine: dashboardDataState.parcours.formationConsultee
    },

    {
        numero: 6,
        titre: "Trouver une universitÃ©",
        description: "Explorer les Ã©tablissements",
        termine: dashboardDataState.parcours.universitesConsultees
    }

    

];

const getEtapeActuelle = (parcours) => {

    if (!parcours.profil) {
        return 1;
    }

    if (!parcours.test) {
        return 1;
    }

    if (!parcours.profilConsulte) {
        return 2;
    }

    if (!parcours.metiersConsultes) {
        return 3;
    }

    if (!parcours.formationConsultee) {
        return 4;
    }

    if (!parcours.universitesConsultees) {
        return 5;
    }

    return 6;
};

const badgeIcons = {
    "premier-pas": UserRound,
    "explorateur": Brain,
    "connaissance-de-soi": Target,
    "decouvreur-metiers": BriefcaseBusiness,
    "choix-carriere": GraduationCap,
    "pret-universite": Landmark,
    "contributeur": MessageSquare,
    "serie-5-jours": Flame,
    "serie-7-jours": Rocket,
    "serie-15-jours": Star,
    "serie-30-jours": Medal
};
  
const etapeActuelle = getEtapeActuelle(dashboardDataState.parcours);

const demanderNotification = async () => {

    if (chargementNotification) {
        return;
    }

    setChargementNotification(true);

    try {

        const response = await fetch(
            `${API_ROUTES_URL}/notifier-fonctionnalite.php`,
            {
                method: "POST",
                credentials: "include",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    fonctionnalite: "COACHING_PERSONNALISE"
                })
            }
        );

        const data = await response.json();

        if (data.success) {

            setTypeNotification("success");

            setMessageNotification(
                data.message ||
                "Vous serez averti dÃ¨s que cette fonctionnalitÃ© sera disponible."
            );

        } else {

            setTypeNotification("error");

            setMessageNotification(
                data.message ||
                "Une erreur est survenue."
            );
        }

    } catch (error) {

        console.error(
            "Erreur inscription notification :",
            error
        );

        setTypeNotification("error");

        setMessageNotification(
            "Impossible de vous inscrire pour le moment."
        );

    } finally {

        setChargementNotification(false);

        setTimeout(() => {
            setMessageNotification("");
            setTypeNotification("");
        }, 4000);

    }
};

    return (

        <div className="dashboard-page">

            {messageNotification && (
    <div className={`dashboard-notification ${typeNotification}`}>
        {typeNotification === "success" ? (
            <Check />
        ) : (
            <Bell />
        )}

        <span>{messageNotification}</span>
    </div>
     )}

            {/* HEADER */}

            <section className="dashboard-header">

    <div className="dashboard-brand">

        <img
            src="/images/logo-nextori.jpg"
            alt="Logo NextOri"
            className="dashboard-logo"
        />

        <div>
            <p className="dashboard-subtitle">
                Tableau de bord
            </p>

            <h1>
                Next<span>Ori</span>
            </h1>
        </div>

    </div>

</section> 

    <OrientationNotification
    etape={getEtapeActuelle(dashboardDataState.parcours)}
    avisDonne={dashboardDataState.parcours.avisDonne}
    onAvis={() => navigate("/avis")}
/>

            {/* NIVEAU */}

           <section className="level-card">

    <div className="level-header">

        <h2>{dashboardDataState.niveau.nom}</h2>

        <span>
       Niveau {dashboardDataState.niveau.numero}
        </span>

    </div>

    <div className="progress-bar">

        <div
    className="progress-fill"
    style={{
        width: `${dashboardDataState.niveau.progression}%`
    }}
      ></div>
    </div>

    <p className="progress-text">

        Progression : {dashboardDataState.niveau.progression}%

    </p>

</section>



            {/* STATISTIQUES */}

            <section className="statistics-section">

    <div className="stat-card">

        <h3><Star /></h3>

         <h2>{dashboardDataState.statistiques.points}</h2>

        <p>Points</p>

    </div>

    <div className="stat-card">

        <h3><Flame /></h3>

        <h2>{dashboardDataState.statistiques.serie}</h2>

        <p>Jours</p>

    </div>

    <div className="stat-card">

        <h3><Award /></h3>

        <h2>{dashboardDataState.statistiques.badges}</h2>

        <p>Badges</p>

    </div>

</section>





            {/* BIENVENUE */}

           <section className="welcome-card">

    <div className="welcome-content">

        <div className="welcome-icon">
            <Hand />
        </div>


        <div>

            <h2>
                Bonjour {dashboardDataState.utilisateur.nom} 
            </h2>


            <p>
                Bienvenue dans votre espace d'orientation NextOri.
            </p>


            
        </div>

    </div>


    


</section>


            {/* PARCOURS */}
                <section className="orientation-path">

    <h2>
        Mon parcours d'orientation
    </h2>


  <div className="path-container">

{
parcours.map((etape, index) => {


const estTermine = etape.termine;


const estActif =
    !estTermine &&
    parcours
    .slice(0, index)
    .every(item => item.termine);


return (

<div
key={etape.numero}
className={`path-item ${
    estTermine ? "completed" 
    :estActif ? "active"
    :""

}`}
>


<div className="path-circle">

{
estTermine
?

<Check />
:
etape.numero
}

</div>


<div>

      <h3>
     {etape.titre}
    </h3>


<p>
{etape.description}
</p>


</div>


</div>

)

})

}

</div>
</section>


{parcours.length === 6 && etapeActuelle === 6 && (
    <section className="avis-dashboard-card">

        <div className="avis-dashboard-icon">
            <MessageSquare />
        </div>

        <div className="avis-dashboard-content">

            {!dashboardDataState.parcours.avisDonne ? (
                <>
                    <span>
                        PARCOURS TERMINÃ‰
                    </span>

                    <h2>
                        Ton avis compte.
                    </h2>

                    <p>
                        Tu viens de parcourir les principales Ã©tapes
                        de ton orientation avec NextOri.
                        Quelques secondes suffisent pour partager
                        ton expÃ©rience et nous aider Ã  amÃ©liorer la plateforme.
                    </p>
                </>
            ) : (
                <>
                    <span>
                        VOTRE EXPÃ‰RIENCE COMPTE
                    </span>

                    <h2>
                        Une suggestion pour NextOri ?
                    </h2>

                    <p>
                        Tu as dÃ©jÃ  partagÃ© ton expÃ©rience avec nous.
                        Mais ton avis peut Ã©voluer avec le temps.
                        Tu peux toujours nous faire part d'une recommandation,
                        d'une idÃ©e ou d'une suggestion pour amÃ©liorer NextOri.
                    </p>
                </>
            )}

            <button
                onClick={() => navigate("/avis")}
            >
                {dashboardDataState.parcours.avisDonne
                    ? "Partager une suggestion"
                    : "Donner mon avis"
                }

                <Rocket />
            </button>

        </div>

    </section>
)}

            {/* ACTIONS RAPIDES */}

            <section className="quick-actions">


    <h2>

        Explorer NextOri

    </h2>



    <div className="actions-grid">


        <div className="action-card">

            <FlaskConical />

            <h3>Test RIASEC</h3>

            <p>
                DÃ©couvrez votre profil.
            </p>

        </div>



        <div className="action-card">

            <BriefcaseBusiness />

            <h3>MÃ©tiers</h3>

            <p>
                Explorez les carriÃ¨res.
            </p>

        </div>



        <div className="action-card">

            <GraduationCap />

            <h3>Formations</h3>

            <p>
                Trouvez une filiÃ¨re.
            </p>

        </div>



        <div className="action-card">

            <Landmark />

            <h3>UniversitÃ©s</h3>

            <p>
                DÃ©couvrez les Ã©tablissements.
            </p>

        </div>


    </div>


</section>
 
       {/* BOUTON */}

      <section className="action-button-section">

    <h2>
        Passez Ã  l'action <Rocket />
    </h2>

    <p>
        DÃ©couvrez votre profil d'orientation
        et construisez votre avenir professionnel avec NextOri.
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
        ? "Voir mes rÃ©sultats"
        : "Commencer le test"}
  </button>

</section>

            {/* PROJET 

            <section className="project-card"> 

    <h2>
    Mon plan d'avenir <Rocket />
</h2>

<p>
    Recevez un plan personnalisÃ© construit Ã  partir de votre profil
    RIASEC, de vos recommandations et de vos objectifs professionnels.
</p>

<div className="future-plan-card"> 

    <div className="future-icon">

        <Compass />

    </div>

    <div className="future-content">

        <h3>

            Votre feuille de route personnalisÃ©e

        </h3>

        <p>

            DÃ©couvrez les Ã©tapes Ã  suivre pour atteindre votre mÃ©tier de
            rÃªve : compÃ©tences Ã  dÃ©velopper, formations recommandÃ©es,
            universitÃ©s adaptÃ©es et conseils personnalisÃ©s.

        </p>

    </div>

 </div>

 <button className="future-button">

    DÃ©couvrir mon plan personnalisÃ©

 </button>

 <p className="premium-note">

    <LockKeyhole /> 
    Disponible prochainement avec NextOri Premium

   </p>

    </section>  */}

   
   


            {/* BESOIN D'AIDE */}

         <section className="help-card">

    <div className="help-top">

        <div className="help-icon">

            <MessageCircle />

        </div>

        <div className="help-card-content">

            <h2>

                Besoin d'aide ?

            </h2>

            <p>

                Nos conseillers seront bientÃ´t disponibles pour rÃ©pondre
                Ã  vos questions et vous accompagner dans votre orientation.

            </p>

        </div>

    </div>

    <div className="help-soon">

        <div className="help-badge">

            <span className="help-dot"></span>

            Disponible trÃ¨s bientÃ´t

        </div>

        <p className="help-soon-text">

            Le coaching personnalisÃ© sera disponible dans une prochaine
            mise Ã  jour de NextOri.

        </p>

       <button
    className="help-button"
    onClick={demanderNotification}
    disabled={chargementNotification}
>
    <Bell />

    {chargementNotification
        ? "Inscription..."
        : "Me notifier"
    }
</button>

    </div>

</section>


{/* BADGES */}
<section className="badges-section">

    <div className="badges-header">

        <div className="badges-title">

            <h2><Award /> Mes badges</h2>

            <p>
                DÃ©bloquez des rÃ©compenses en progressant dans votre parcours d'orientation.
            </p>

        </div>

    </div>

    <div className="badges-container">

        {dashboardDataState.liste_badges.map((badge, index) => {

    const IconeBadge = badgeIcons[badge.icone];

    return (
        <div
            key={index}
            className="badge-card"
        >

            <div className="badge-icon">

                {IconeBadge && <IconeBadge />}

            </div>

            <p className="badge-name">
                {badge.nom}
            </p>

            <p className="badge-status">
                DÃ©bloquÃ© âœ“
            </p>

        </div>
    );

})}

    </div>

</section>

  <Footer />
         
            {/* FOOTER */}

            <FooterNavigation />

        </div>

    );

}

export default Dashboard;
