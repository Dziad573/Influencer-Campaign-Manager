import React, { useState } from 'react';
import axios from 'axios';
import useStore from '../store/useStore';
import { useNavigate } from 'react-router-dom';

export const LoginPage = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const { setUser } = useStore();
    const navigate = useNavigate();

    const handleLogin = async () => {
        try {
            const res = await axios.post('http://localhost:3001/login', { email, password });
            setUser(res.data);
            localStorage.setItem('user', JSON.stringify(res.data));
            navigate('/');
        } catch (err) {
            alert('Błędne dane logowania');
        }
    };

    return (
        <div>
            <h2>Logowanie</h2>
            <input 
                placeholder="Email" 
                value={email} 
                onChange={e => setEmail(e.target.value)} />
            <input
                placeholder="Hasło"
                type="password"
                value={password}
                onChange={e => setPassword(e.target.value.trim())}
            />            
            <button onClick={handleLogin}>Zaloguj</button>
        </div>
    );
};