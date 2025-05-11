import React, { useEffect, useState } from 'react';
import useStore from '../store/useStore';
import './home.scss';

export const HomePage = () => {
    const { theme } = useStore();

    const [topCampaigns, setTopCampaigns] = useState([]);
    const [upcomingCampaigns, setUpcomingCampaigns] = useState([]);
    
    useEffect(() => {
    document.documentElement.setAttribute('data-theme', theme);
    }, [theme]);

    {/* Fetching top campaigns */}
    useEffect(() => {
        fetch('http://localhost:3001/campaign_effects')
            .then(res => res.json())
            .then(data => setTopCampaigns(data))
            .catch(err => console.error('Błąd:', err));
    }, []);
    
    {/* Fetching upcoming campaigns */}
    useEffect(() => {
        fetch('http://localhost:3001/campaigns')
            .then(res => res.json())
            .then(data => setUpcomingCampaigns(data))
            .catch(err => console.error('Błąd:', err));
    }, []);
    
    return (
        <div className="homepage">
        {/* HERO */}
        <section className="hero">
            <video className="hero__video" src="/video/hero.mp4" autoPlay loop muted playsInline></video>
            <div className="hero__overlay">
            <h1 className="hero__title">Zarządzaj kampaniami z influencerami skutecznie</h1>
            <p className="hero__subtitle">Nowoczesna platforma do śledzenia wyników i zarządzania współpracami</p>
            <p className="hero__cta">Rozpocznij teraz</p>
            </div>
        </section>

        {/* Top Campaigns */}
        <section className="section section--top-campaigns">
            <h2 className="section__title">Top Kampanie</h2>
            <div className="campaigns">
            {topCampaigns.map(camp => (
                <div key={camp.id} className="campaign-card">
                <h3>{camp.name}</h3>
                <p>Zasięg: {camp.views} / Polubienia: {camp.likes}</p>
                <p /*to={`/campaigns/${camp.id}`}*/ >Szczegóły</p>
                </div>
            ))}
            </div>
        </section>

        {/* Upcomming Campaigns */}
        <section className="section section--upcoming-campaigns">
            <h2 className="section__title">Nadchodzące kampanie</h2>
            <ul className="upcoming-list">
            {upcomingCampaigns.map(camp => (
                <li key={camp.id} className="upcoming-item">
                <span>{camp.name}</span> — <span>{camp.start_date}</span>
                </li>
            ))}
            </ul>
        </section>
        </div>
    );
};