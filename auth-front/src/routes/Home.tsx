import { useNavigate } from "react-router-dom";
import DefaultLayout from "../layout/DefaultLayout";
import logo from "../assets/logo.png"; //CAMBIARRRR

export default function Home(){
    const navigate = useNavigate();

    return (
        <div className="background">
            <div className="overlay-box">
                <DefaultLayout>
                <img src={logo} alt="EntrApp Logo" className="logo" />
                <h1>EntrApp</h1>
                <p>Recursos Humanos</p>

                <div className="login-container">
                    <button onClick={() => navigate("/login")}>Iniciar sesión</button>
                </div>
                </DefaultLayout>
            
            </div>
        </div>
    );
}