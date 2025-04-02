import { useState } from "react";
import DefaultLayout from "../layout/DefaultLayout"
import { useAuth } from "../auth/AuthProvider";
import { Navigate } from "react-router-dom";
import "../login.css"

export default function Login(){
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");

    const auth = useAuth();

    if(auth.isAuthenticated){
        return <Navigate to="/dashboard" />;
    }

    return (
    <DefaultLayout>
         <form className="form"> 
        <h1>Login</h1>
        <label>Usuario</label>
        <input type="text" value = {username} onChange={(e) => setUsername(e.target.value)}/>

        <label>Contraseña</label>
        <input type="password" value = {password} onChange={(e) => setPassword(e.target.value)}/>

        <button>Iniciar Sesión</button>
    </form>
    </DefaultLayout>
   );
}