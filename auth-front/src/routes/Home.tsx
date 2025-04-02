import DefaultLayout from "../layout/DefaultLayout";
import logo from "../assets/logo.png"; //CAMBIARRRR

export default function Home(){
    return (
        <div className="background">
            <div className="overlay-box">
                <DefaultLayout>
                <img src={logo} alt="EntrApp Logo" className="logo" />
                <h1>EntrApp</h1>
                <p>Recursos Humanos</p>

                <div className="login-container">
                    <button>Iniciar sesión</button>
                </div>
                </DefaultLayout>
            
            </div>
        </div>
    );
}