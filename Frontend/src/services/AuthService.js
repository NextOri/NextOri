const API_URL = "http://localhost/NextOri/Backend/api/routes";


export async function login(email, mot_de_passe) {

    const response = await fetch(
        `${API_URL}/login.php`,
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                email,
                mot_de_passe
            })
        }
    );

    return await response.json();

}



export async function register(utilisateur) {

    const response = await fetch(
        `${API_URL}/register.php`,
        {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(utilisateur)
        }
    );

    return await response.json();

}



export async function getProfile(id_user) {

    const response = await fetch(
        `${API_URL}/profile.php?id_user=${id_user}`,
        {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        }
    );

    return await response.json();

}