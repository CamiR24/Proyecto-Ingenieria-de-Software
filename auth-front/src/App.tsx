import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Login from './auth/Login';
import Dashboard from './routes/Dashboard';

const App: React.FC = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<Login />} />
        <Route path="/dashboard" element={<Dashboard />} />
        {/* Si la ruta no coincide, redirige al Login */}
        <Route path="*" element={<Login />} />
      </Routes>
    </BrowserRouter>
  );
};

export default App;