import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../login.css'; // Asegurate de que la ruta sea correcta

const Login: React.FC = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [errorMessage, setErrorMessage] = useState<string | null>(null);
  const navigate = useNavigate();

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault(); // Previene que la página se recargue
    console.log('handleSubmit iniciado'); // Depuración
    setErrorMessage(null);

    try {
      const response = await fetch('http://localhost:3000/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password })
      });

      const data = await response.json();
      console.log('Respuesta del servidor:', data); // Depuración

      if (response.ok) {
        // Si el login es exitoso, redirige al Dashboard
        navigate('/dashboard');
      } else {
        setErrorMessage(data.message || 'Usuario o contraseña incorrectos');
      }
    } catch (error) {
      console.error('Error en el fetch:', error);
      setErrorMessage('Error al conectar con el servidor');
    }
  };

  return (
    <div className="background-login">
      <div className="overlay-box-login">
        <form onSubmit={handleSubmit} className="form">
          <h1>Iniciar Sesión</h1>

          <label htmlFor="username">Usuario</label>
          <input
            type="text"
            id="username"
            placeholder="Ingresa tu usuario"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />

          <label htmlFor="password">Contraseña</label>
          <input
            type="password"
            id="password"
            placeholder="Ingresa tu contraseña"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />

          <div className="button-login">
            <button type="submit">Iniciar sesión</button>
          </div>
        </form>

        {errorMessage && (
          <div className="message" style={{ marginTop: '20px', fontWeight: 600, color: 'white' }}>
            {errorMessage}
          </div>
        )}
      </div>
    </div>
  );
};

export default Login;