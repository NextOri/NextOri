const API_URL = "http://localhost/NextOri/Backend/api/routes";


export async function recupererSeries() {

    try {

        const response = await fetch(
            `${API_URL}/series.php`,
            {
                method: "GET",
                headers: {
                    "Content-Type": "application/json"
                }
            }
        );

        return await response.json();

    } catch (error) {

        console.error(
            "Erreur lors de la récupération des séries :",
            error
        );

        return [];

    }
}