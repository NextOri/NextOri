import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

import "../styles/OrientationNotification.css";

function OrientationNotification({ etape }) {

    const [visible, setVisible] = useState(true)

    const navigate = useNavigate();

   const notifications = {

    2: {
        titre: "🧠 Découvrez votre profil RIASEC",
        message:
        "Votre prochaine étape est de consulter votre profil. " +
        "Rendez-vous dans la page des résultats et cliquez sur « Détails du profil » " +
        "pour découvrir vos points forts, vos compétences naturelles et les environnements professionnels adaptés."
    },


    3: {
        titre: "💼 Explorez vos métiers",
        message:
        "Votre profil a été découvert. Maintenant, explorez les métiers proposés. " +
        "Consultez les métiers recommandés pour comprendre les domaines professionnels " +
        "qui correspondent à votre personnalité et à vos intérêts."
    },


    4: {
        titre: "🎓 Découvrez les formations",
        message:
        "Après avoir exploré les métiers, découvrez les formations adaptées. " +
        "Consultez les filières proposées pour savoir quelles études suivre afin d'atteindre vos objectifs professionnels."
    },


    5: {
        titre: "🏛️ Trouvez vos universités",
        message:
        "Votre prochaine étape est de rechercher une université. " +
        "Découvrez les établissements qui proposent les formations nécessaires pour votre projet d'orientation."
    },


    6: {
        titre: "🎉 Parcours terminé",
        message:
        "Félicitations ! Vous avez terminé votre parcours d'orientation NextOri. " +
        "Vous pouvez maintenant consulter vos recommandations et construire votre projet."
    }

};

    const notification = notifications[etape];

    if (!notification || !visible) {
    return null;
}
    


    // aucune notification si aucune étape correspond
    if (!notification) {
        return null;
    }


    return (

        <div className="orientation-notification">

    <button
        className="notification-close"
        onClick={() => setVisible(false)}
    >
        ×
    </button>


    <div className="notification-header">

        <h3>
            {notification.titre}
        </h3>

    </div>


    <p>
        {notification.message}
    </p>

</div>

    );

}


export default OrientationNotification;