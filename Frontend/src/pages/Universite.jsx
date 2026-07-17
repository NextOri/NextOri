import "../styles/Universite.css";


function Universite(){


    const universites = [


        {
            id_universite:1,

            nom:"Université Cheikh Anta Diop de Dakar",

            description:
            "L'UCAD est une université publique proposant plusieurs formations dans les domaines scientifiques, techniques, économiques et sociaux.",

            type:"Université publique",

            pays:"Sénégal",

            ville:"Dakar",

            site_web:"https://www.ucad.sn"

        },


        {
            id_universite:2,

            nom:"Université Gaston Berger de Saint-Louis",

            description:
            "L'UGB propose des formations dans plusieurs domaines notamment les sciences, l'informatique, l'économie et la gestion.",

            type:"Université publique",

            pays:"Sénégal",

            ville:"Saint-Louis",

            site_web:"https://www.ugb.sn"

        }


    ];





    return (


        <div className="universites-page">


            <header className="universites-header">

                <h1>
                    Universités disponibles
                </h1>

                <p>
                    Découvrez les établissements liés à votre formation.
                </p>

            </header>





            <section className="universites-list">


                {
                    universites.map((universite)=>(


                        <article

                        className="universite-card"

                        key={universite.id_universite}

                        >


                            <h2>
                                {universite.nom}
                            </h2>



                            <div className="universite-info">


                                <p>
                                    <strong>Type :</strong>{" "}
                                    {universite.type}
                                </p>


                                <p>
                                    <strong>Localisation :</strong>{" "}
                                    {universite.pays} - {universite.ville}
                                </p>


                                <p>

                                    <strong>Site web :</strong>{" "}

                                    <a

                                    href={universite.site_web}

                                    target="_blank"

                                    rel="noopener noreferrer"

                                    >

                                        Visiter le site

                                    </a>

                                </p>


                            </div>




                            <p>

                                {universite.description}

                            </p>



                            <button className="details-universite-button">

                                Voir les détails

                            </button>



                        </article>


                    ))
                }



            </section>



        </div>


    );


}



export default Universite;