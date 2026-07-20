import { BrowserRouter, Routes, Route } from "react-router-dom";

import Home from "./pages/Home";
import Test from "./pages/Test";
import Result from "./pages/Result";
import ProfilRiasec from "./pages/Profil-Riasec";
import Formations from "./pages/Formations";
import Universite from "./pages/Universite";


function App() {

    return (

        
       
        <Routes>

            <Route path="/" element={<Home />} />

            <Route path="/test" element={<Test />} />

            <Route path="/result" element={<Result />} />

            <Route path="/formations" element={<Formations />} />

            <Route path="/universites" element={<Universite />} />

            <Route path="/profil-riasec" element={<ProfilRiasec />} />
            

        </Routes>
      

      
    );

}

export default App;