import { useState, useEffect } from 'react';
import "../QR.css"
import DefaultLayout from '../layout/DefaultLayout';
import { FaClock, FaCalendarAlt } from 'react-icons/fa';

function CheckInPage() {
    const [employeeCode, setEmployeeCode] = useState('');
    const [action, setAction] = useState('entrada');
    const [currentDate, setCurrentDate] = useState('');
    const [currentHour, setCurrentHour] = useState('');
    
    useEffect(() => {
      const updateTime = () => {
        const now = new Date();
        setCurrentDate(now.toLocaleDateString());
        setCurrentHour(now.toLocaleTimeString());
      };
      updateTime();
      const interval = setInterval(updateTime, 1000);
      return () => clearInterval(interval);
    }, []);

    //CAMBIAR
    const handleSubmit = async (e: { preventDefault: () => void; }) => {
        e.preventDefault();
        const response = await fetch('http://localhost:5173/api/register-checkin', { //CAMBIAR 
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ employeeCode, action, timestamp: new Date() })
        });
        const data = await response.json();
        alert(data.message);
    };

    return (
        <div className='background'>
            <div className="overlay-box-qr">
            <DefaultLayout>
            <h1>Registro de Entrada/Salida</h1>
            
            <div className="datetime-display">
                    <p>
                        <FaCalendarAlt />
                        <span>{currentDate}</span>
                    </p>
                
                
                    <p>
                        <FaClock />
                        <span>{currentHour}</span>
                    </p>
            </div>

            <form onSubmit={handleSubmit}>
                <label>
                    Código de Empleado:
                    <input type="text" value={employeeCode} onChange={(e) => setEmployeeCode(e.target.value)} required />
                </label>
                <div className='select-row'>
                    <label htmlFor='accion'>Elije una opción: </label>
                            <select id="accion" className="select-action" value={action} onChange={(e) => setAction(e.target.value)}>
                                <option value="entrada">Entrada</option>
                                <option value="salida">Salida</option>
                            </select>
                </div>
                <div className='button-qr'>
                    <button type="submit">Enviar</button>
                </div>
            </form>
            </DefaultLayout>
            </div>
        </div>
    );
}

export default CheckInPage;
