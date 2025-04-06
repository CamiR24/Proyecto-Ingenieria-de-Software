// server.js

const express = require('express');
const bcrypt = require('bcrypt');
const cors = require('cors');

const app = express();
const port = 3000;

// Middleware para parsear JSON y permitir CORS
app.use(express.json());
app.use(cors());

// Usuario definido manualmente
const usuarioDefinido = {
  username: 'usuario', // Cambia este valor si lo deseas
  // Contraseña "password123" encriptada con bcrypt (10 salt rounds)
  passwordHash: bcrypt.hashSync('password123', 10)
};

// Endpoint de loginesto
app.post('/login', async (req, res) => {
  const { username, password } = req.body;

  // Verifica el nombre de usuario
  if (username !== usuarioDefinido.username) {
    return res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
  }

  // Compara la contraseña ingresada con la almacenada (encriptada)
  const passwordValido = await bcrypt.compare(password, usuarioDefinido.passwordHash);
  if (!passwordValido) {
    return res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
  }

  // Si todo es correcto, responde con un token (simulado) y mensaje de éxito
  res.json({ message: 'Login exitoso', token: 'fake-jwt-token' });
});

// Levanta el servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});