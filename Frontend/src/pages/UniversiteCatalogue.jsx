import { useEffect, useMemo, useState } from "react";
import { useNavigate } from "react-router-dom";

import FooterNavigation from "../components/FooterNavigation";



import "../styles/UniversiteCatalogue.css";

import { afficherTypeUniversite } from "../utils/universiteUtils";

const API_URL =
  "http://localhost/nextori/backend/api/routes/universite-catalogue.php";

export default function UniversiteCatalogue() {
  const navigate = useNavigate();

  const [universites, setUniversites] = useState([]);

  const [loading, setLoading] = useState(true);

  const [search, setSearch] = useState("");

  const [selectedType, setSelectedType] = useState("");

  const [selectedRegion, setSelectedRegion] = useState("");

  useEffect(() => {
    fetch(API_URL)
      .then((response) => response.json())
      .then((data) => {
        if (data.success) {
          setUniversites(data.data);
        }
      })
      .catch((error) =>
        console.error("Erreur récupération universités :", error)
      )
      .finally(() => setLoading(false));
  }, []);

  const normaliserTexte = (texte) => {

    return texte
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .toLowerCase()
        .trim();

  };

  const regions = useMemo(() => {
    return [...new Set(universites.map((u) => u.region))].sort();
  }, [universites]);

  const universitesFiltrees = universites.filter((universite) => {
    const recherche =
      normaliserTexte(universite.nom).includes(normaliserTexte(search)) ||
      normaliserTexte(universite.description).includes(normaliserTexte(search));

    const type =
      selectedType === "" || universite.type === selectedType;

    const region =
      selectedRegion === "" || universite.region === selectedRegion;

    return recherche && type && region;
  });

  if (loading) {
    return (
      <div className="no-universite-catalogue-loading">
        Chargement des universités...
      </div>
    );
  }

  return (
    <div className="no-universite-catalogue-page">

      <div className="no-universite-catalogue-header">

        <h1>Explorer les universités</h1>

        <p>
          Trouvez l'établissement qui correspond à votre projet académique.
        </p>

      </div>

      <div className="no-universite-catalogue-toolbar">

        <input
          type="text"
          placeholder="Rechercher une université..."
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="no-universite-catalogue-search"
        />

        <select
          value={selectedType}
          onChange={(e) => setSelectedType(e.target.value)}
          className="no-universite-catalogue-filter"
        >
          <option value="">Tous les types</option>
          <option value="publique">Publique</option>
          <option value="privee">Privée</option>
        </select>

        <select
          value={selectedRegion}
          onChange={(e) => setSelectedRegion(e.target.value)}
          className="no-universite-catalogue-filter"
        >
          <option value="">Toutes les régions</option>

          {regions.map((region) => (
            <option key={region} value={region}>
              {region}
            </option>
          ))}
        </select>
      </div>

      <div className="no-universite-catalogue-counter">
        {universitesFiltrees.length} 
         {" "}

                université

                {universitesFiltrees.length > 1 ? "s" : ""}

                {" "}

                trouvée

                {universitesFiltrees.length > 1 ? "s" : ""}
      </div>

      <div className="no-universite-catalogue-grid">

        {universitesFiltrees.map((universite) => (

          <div
            key={universite.id_universite}
            className="no-universite-catalogue-card"
          >

            <div className="no-universite-catalogue-logo">

              <img
                src={universite.logo}
                alt={universite.nom}
              />

            </div>

            <h2>{universite.nom}</h2>

            <p className="no-universite-catalogue-description">
              {universite.description}
            </p>

            <span
              className={`no-universite-catalogue-type ${universite.type}`}
            >
              {afficherTypeUniversite(universite.type)}
            </span>

            <div className="no-universite-catalogue-localisation">

              📍 {universite.ville} • {universite.region}

            </div>

            <button
              className="no-universite-catalogue-button"
              onClick={() =>
                navigate(`/universite-catalogue/${universite.id_universite}`)
              }
            >
              Voir les détails →
            </button>

          </div>

        ))}

      </div>

      

      <FooterNavigation />

    </div>
  );
}