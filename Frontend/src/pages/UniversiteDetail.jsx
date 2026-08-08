import { useEffect, useState } from "react";
import { useParams } from "react-router-dom";
import FooterNavigation from "../components/FooterNavigation";
import "../styles/universite-detail.css";
import { afficherTypeUniversite } from "../utils/universiteUtils";

function UniversiteDetail() {

    const { id_universite } = useParams();

    const [universite, setUniversite] = useState(null);
    const [detail, setDetail] = useState(null);
    const [filieres, setFilieres] = useState([]);
    const [chargement, setChargement] = useState(true);

    useEffect(() => {

        fetch(
            `http://localhost/NextOri/Backend/api/routes/universite-detail.php?id_universite=${id_universite}`
        )
            .then((reponse) => reponse.json())
            .then((data) => {

                if (data.success) {

                    setUniversite(data.universite);
                    setDetail(data.detail);
                    setFilieres(data.filieres);

                }

                setChargement(false);

            })
            .catch((erreur) => {

                console.error(erreur);
                setChargement(false);

            });

    }, [id_universite]);

    if (chargement) {

        return <h2>Chargement...</h2>;

    }

    if (!universite) {

        return <h2>Université introuvable.</h2>;

    }

    return (

        <div className="no-universite-detail-page">

            <div className="no-universite-detail-header">

                <img
                    src={universite.logo}
                    alt={universite.nom}
                    className="no-universite-detail-logo"
                />

                <h1>{universite.nom}</h1>

                <span className="no-universite-detail-type">
                    {afficherTypeUniversite(universite.type)}
                </span>

            </div>

            <div className="no-universite-detail-content">

                <section className="no-universite-detail-presentation">

                    <h2>Présentation</h2>

                    <p>{detail?.presentation}</p>

                </section>

                <section className="no-universite-detail-informations">

    <h2>Informations</h2>

    <p><strong>Ville :</strong> {universite.ville}</p>

    <p><strong>Région :</strong> {universite.region}</p>

    {
        universite.site_web &&
        (
            <a
                href={universite.site_web}
                target="_blank"
                rel="noopener noreferrer"
                className="no-universite-detail-site-button"
            >
                Visiter le site officiel
            </a>
        )
       }

      </section>

                <section className="no-universite-detail-admission">

                    <h2>Conditions d'admission</h2>

                    <p>{detail?.conditions_admission}</p>

                </section>

                <section className="no-universite-detail-bourses">

                    <h2>Bourses</h2>

                    <p>{detail?.bourses}</p>

                </section>

                <section className="no-universite-detail-filieres">

                    <h2>Filières proposées</h2>

                    <div className="no-universite-detail-filieres-grid">

                        {filieres.map((filiere) => (

                            <div
                                key={filiere.id_filiere}
                                className="no-universite-detail-filiere-card"
                            >

                                <h3>{filiere.nom}</h3>

                                <p>{filiere.domaine}</p>

                                <p>{filiere.duree}</p>

                                <button
                                    className="no-universite-detail-button"
                                    onClick={() => {
                                        window.location.href = `/filieres/${filiere.id_filiere}`;
                                    }}
                                >
                                    Voir la filière
                                </button>

                            </div>

                        ))}

                    </div>

                </section>

            </div>

            <div className="no-universite-detail-retour">

    <button
        onClick={() => {
            window.location.href = "/universite-catalogue";
        }}
        className="no-universite-detail-retour-button"
    >
        ← Retour aux universités
    </button>

    </div>

            <FooterNavigation />

        </div>

    );

}

export default UniversiteDetail;