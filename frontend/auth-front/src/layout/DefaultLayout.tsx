import React from "react";
//import { Children } from "react";
import { Link } from "react-router-dom";

interface DefaultLayoutProps{
    children: React.ReactNode;
}

export default function DefaultLayout({children}: DefaultLayoutProps){
    return(
        <>
            <header>
                <nav>
                    <ul>
                        <li>
                            <Link to="/">Home</Link>
                        </li>
                        <li>
                            <Link to="/login">Iniciar Sesión</Link>
                        </li>
                    </ul>
                </nav>
            </header>

            <main>
                {children}
            </main>
        </>
    )
}