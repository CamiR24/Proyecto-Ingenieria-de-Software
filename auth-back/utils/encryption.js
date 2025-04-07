// utils/encryption.js

const bcrypt = require('bcrypt');

exports.encryptPassword = (plainPassword) => {
  return bcrypt.hashSync(plainPassword, 10);
};

exports.comparePassword = async (plainPassword, hash) => {
  return await bcrypt.compare(plainPassword, hash);
};