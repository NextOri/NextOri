import { Routes, Route } from "react-router-dom";

import Home from "./pages/Home";
import Test from "./pages/Test";
import Resultat from "./pages/Resultat";
import Metier from "./pages/Metier";
import Filiere from "./pages/Filiere";
import Universite from "./pages/Universite";

function App() {

    return (

        <Routes>

            <Route path="/" element={<Home />} />

            <Route path="/test" element={<Test />} />

            <Route path="/resultat" element={<Resultat />} />

            <Route path="/metier/:id" element={<Metier />} />

            <Route path="/filiere/:id" element={<Filiere />} />

            <Route path="/universite/:id" element={<Universite />} />

        </Routes>

    );

}

export default App;