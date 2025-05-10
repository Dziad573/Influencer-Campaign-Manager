import React, { useEffect, useState } from 'react';

export const App = () => {
    const [influencers, setInfluencers] = useState([]);
    
    useEffect(() => {
        fetch('http://localhost:3001/influencers')
            .then(res => res.json())
            .then(data => setInfluencers(data))
            .catch(err => console.error('Błąd:', err));
    }, []);
    
    return (
        <div>
            <h1>Lista influencerów</h1>
            <ul>
            {influencers.map((inf) => (
                <li key={inf.influencer_id}>{inf.first_name} {inf.last_name}</li>
            ))}
            </ul>
        </div>
    );
};
