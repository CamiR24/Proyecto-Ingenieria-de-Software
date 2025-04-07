import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import "./index.css"
import { createBrowserRouter, RouterProvider } from 'react-router-dom'
import Home from './routes/Home.tsx'
//import Login from './routes/Login.tsx' 
import Login2 from './auth/Login.tsx'
import Dashboard from './routes/Dashboard.tsx'
import ProtectedRoute from './routes/ProtectedRoute.tsx'
import { AuthProvider } from './auth/AuthProvider.tsx'
import QRCheckIn from './routes/QRCheckIn.tsx'

//Creación rutas en URL
const router = createBrowserRouter([
  {
    path: "/", 
    element: <Home />,
  },
  {
    path: "/login",
    element: <Login2 />,
  },
  {
    path: "/qr",
    element: <QRCheckIn />,
  },
  {
    path: "/",
    element: <ProtectedRoute />, //Solo si tiene el usuario y contraseña dejará entrar
    children: [
      {
        path: "/dashboard",
        element: <Dashboard />
      },
    ],
  },
]);
createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <AuthProvider>
      <RouterProvider router={router} />
    </AuthProvider>
  </StrictMode>,
)
