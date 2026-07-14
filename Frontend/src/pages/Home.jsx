import Navbar from "../components/Navbar";


import HeroSection from "../components/HeroSection";
import FeaturesSection from "../components/FeaturesSection";
import CTASection from "../components/CTASection";

import Footer from "../components/Footer";
import "../styles/Home.css";



function Home(){

    return(

        <>

            <Navbar />

            <HeroSection />

            <FeaturesSection />

            <CTASection />

            <Footer />

        </>

    );

}


export default Home;