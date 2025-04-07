import React, { useState } from 'react';
import '../login.css';

const Login: React.FC = () => {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault(); // 🚫 Detiene el refresh del form
    setMessage(null);

    try {
      const response = await fetch('http://localhost:3000/login', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ username, password }),
      });

      const data = await response.json();

      if (response.ok) {
        setMessage(`✅ ${data.message}`);
      } else {
        setMessage(`❌ ${data.message || 'Credenciales incorrectas'}`);
      }
    } catch (error) {
      console.error(error);
      setMessage('⚠️ Error al conectar con el servidor');
    }
  };

  return (
    <div className="background-login">
      <div className="overlay-box-login">
        <form onSubmit={handleSubmit} className="form">
          <h1>Iniciar sesión</h1>

          <label htmlFor="username">Usuario</label>
          <input
            id="username"
            type="text"
            value={username}
            placeholder="Ingrese su usuario"
            onChange={(e) => setUsername(e.target.value)}
          />

          <label htmlFor="password">Contraseña</label>
          <input
            id="password"
            type="password"
            value={password}
            placeholder="Ingrese su contraseña"
            onChange={(e) => setPassword(e.target.value)}
          />

          <div className="button-login">
            <button type="submit">Iniciar sesión</button>
          </div>
        </form>

        {message && (
          <div style={{ marginTop: '20px', fontWeight: 600, color: 'white' }}>
            {message}
          </div>
        )}
      </div>
    </div>
  );
};

export default Login;