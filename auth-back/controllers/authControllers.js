// controllers/authController.js

const bcrypt = require('bcrypt');

// Usuario definido manualmente
const usuarioDefinido = {
  username: 'usuario', // Cambia este valor si lo necesitas
  // La contraseña "password123" encriptada (10 salt rounds)
  passwordHash: bcrypt.hashSync('password123', 10)
};

exports.login = async (req, res) => {
  const { username, password } = req.body;

  // Verifica si el usuario existe
  if (username !== usuarioDefinido.username) {
    return res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
  }

  // Compara la contraseña proporcionada con la encriptada
  const passwordValido = await bcrypt.compare(password, usuarioDefinido.passwordHash);
  if (!passwordValido) {
    return res.status(401).json({ message: 'Usuario o contraseña incorrectos' });
  }

  // Si todo es correcto, responde con un token (simulado) y mensaje de éxito
  res.json({ message: 'Login exitoso', token: 'fake-jwt-token' });
};