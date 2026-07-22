import { useNavigate } from "react-router-dom";

function CTASection() {

    const navigate = useNavigate();

    return (

        <section className="cta">

            <h2>Prêt à découvrir ton avenir ?</h2>

            <p>

                Passe gratuitement le test RIASEC et découvre les métiers,
                les filières et les universités adaptées à ton profil.

            </p>

            <div className="cta-buttons">

                <button
                    className="btn-primary"
                    onClick={() => navigate("/test")}
                >
                    Commencer le test
                </button>

                <button 
                className="btn-secondary"
    onClick={() => navigate("/dashboard")}
>
    Explorer la plateforme
</button>

            </div>

        </section>

    );

}

export default CTASection;