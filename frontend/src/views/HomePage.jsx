import React, { useEffect, useState } from 'react';
import axios from 'axios';
import useStore from '../store/useStore';
import { getTopCampaigns, getUpcomingCampaigns } from '../services/campaignService';
import './home.scss';
export const HomePage = () => {
    const { 
        theme,
        
        setUser,
        setUpcomingCampaigns,
        setTopCampaigns,
        setNumberOfCampaigns,
        setNumberOfInfluencers,
        setNumberOfLikes,

        user,
        upcomingCampaigns,
        topCampaigns,
        numberOfCampaigns,
        numberOfInfluencers,
        numberOfLikesForAllCampaigns,

    } = useStore();
    
    useEffect(() => {
        document.documentElement.setAttribute('data-theme', theme);
    }, [theme]);

    // useEffect(() => {
    //     const userId = JSON.parse(localStorage.getItem("user"))?.id;

    //     if (userId) {
    //         axios.get(`http://localhost:3001/users/${userId}`)
    //             .then(res => {
    //                 console.log('Dane użytkownika:', res.data);
    //                 setUser(res.data);
    //             })
    //             .catch(err => console.error('Błąd pobierania użytkownika:', err));
    //     }
    // }, []);



    useEffect(() => {
        async function fetchData() {
            const data = await getTopCampaigns();
            setTopCampaigns(data);
        }

        fetchData();
    }, []);

    useEffect(() => {
        async function fetchData() {
            const data = await getUpcomingCampaigns();
            setUpcomingCampaigns(data);
        }

        fetchData();
    }, []);

//     {/* Fetching top campaigns */}
//     useEffect(() => {
//     axios.get('http://localhost:3001/campaigns/top_campaigns')
//         .then(res => setTopCampaigns(res.data))
//         .catch(err => console.error('Błąd (top_campaigns):', err));
// }, [setTopCampaigns]);
    
//     {/* Fetching upcoming campaigns */}
//     useEffect(() => {
//         axios.get('http://localhost:3001/campaigns/upcoming_campaigns')
//             .then(res => setUpcomingCampaigns(res.data))
//             .catch(err => console.error('Błąd (upcoming_campaigns):', err));
//     }, [setUpcomingCampaigns]);

//     {/* Fetching the total number of campaigns */}
//     useEffect(() => {
//         axios.get('http://localhost:3001/campaigns/count')
//             .then(res => setNumberOfCampaigns(res.data))
//             .catch(err => console.error('Błąd (campaigns/count):', err));
//     }, [setNumberOfCampaigns]);

//     {/* Fetching the total number of influencers */}
//     useEffect(() => {
//         axios.get('http://localhost:3001/influencers/count')
//             .then(res => setNumberOfInfluencers(res.data))
//             .catch(err => console.error('Błąd (influencers/count):', err));
//     }, [setNumberOfInfluencers]);

//     {/* Fetching the total number of likes across all campaigns */}
//     useEffect(() => {
//         axios.get('http://localhost:3001/campaign_effects/likes/total')
//             .then(res => setNumberOfLikes(res.data))
//             .catch(err => console.error('Błąd (likes/total):', err));
//     }, [setNumberOfLikes]);

    
    {/* Filter upcoming campaigns */}
    // const upcomingCampaignsFilter = upcomingCampaigns.filter(c => new Date(c.start_date) > new Date());
    
    return (
        <div className="homepage">
            {/* HERO */}
            <section className="hero">
                {/* <video className="hero__video" src="/video/hero.mp4" autoPlay loop muted playsInline></video> */}
                <div className="hero__overlay">
                    <h1 className="hero__title">Zarządzaj kampaniami z influencerami skutecznie</h1>
                    <p className="hero__subtitle">Nowoczesna platforma do śledzenia wyników i zarządzania współpracami</p>
                    <p className="hero__cta">Rozpocznij teraz</p>
                    <h1>{user ?  `Witaj, ${user.username} !` : ''}</h1>
                </div>
            </section>

            {/* Top Campaigns */}
            
            <section className="section section--top-campaigns">
                <h2 className="section__title">Top Kampanie</h2>
                <div className="campaigns">
                {topCampaigns.map(effect => (
                    <div key={effect.effect_id} className="campaign-card">
                        <h3>{effect.Campaign.name} - {effect.Campaign.client}</h3>
                        <p>Wyświetlenia: {effect.views} / Polubienia: {effect.likes}</p>
                        
                    </div>
                ))}
                </div>
            </section>

            {/*All campaigns*/}
            {/* <section className="section section--top-campaigns">
                <h2 className="section__title">Kampanie</h2>
                <div className="campaigns">
                {campaigns.map(campaign => (
                    <div key={campaign.campaign_id} className="campaign-card">
                        <h3>Nazwa: {campaign.name}</h3>

                    </div>
                ))}
                </div>
            </section> */}


            {/* Upcoming Campaigns */}
            <section className="section section--upcoming-campaigns">
                <h2 className="section__title">Nadchodzące kampanie</h2>
                <ul className="upcoming-list">
                {upcomingCampaigns.map(camp => (
                    <li key={camp.campaign_id} className="upcoming-list__item">
                        <span>{camp.name}</span> — <span>{camp.start_date}</span>
                        <p>Opis: {camp.description}</p>
                        <p>Data rozpoczęcia: {camp.start_date}</p>
                        <p>Data zakończenia: {camp.end_date}</p>
                            Influencerzy:
                                <ul>
                                    {camp.CampaignInfluencers && camp.CampaignInfluencers.length > 0 ? (
                                        camp.CampaignInfluencers.map(influencer => (
                                            <li key={influencer.influencer_id} className="influencer-name"> 
                                                <p>{influencer.Influencer.first_name } {influencer.Influencer.last_name}</p>
                                            </li>
                                        ))
                                    ):  (
                                            <p>Aktualnie żaden influencer nie jest przypisany do tej kampanii</p>
                                        )
                                    }
                                </ul>
                            
                    </li>
                ))}
                </ul>
            </section>

            <section className="section section--cta">
                <h2 className="section__title">Dołącz do naszej platformy</h2>
                <p>Zostań częścią sieci – jako influencer lub menedżer kampanii!</p>
                <div className="cta-buttons">
                    <button className="cta-button influencer">
                        <i className="fas fa-user-astronaut"></i> Zarejestruj się jako influencer
                    </button>
                    <button className="cta-button manager">
                        <i className="fas fa-chart-line"></i> Zarejestruj się jako menedżer
                    </button>
                </div>
            </section>

            {/* Statistics */}
            {/* <section className="section section--stats">
                <h2 className="section__title">Statystyki</h2>
                <div className="stats">
                    <div className="stat-box">
                        {console.log(topCampaigns)}
                        {console.log(numberOfInfluencers)}
                        <span className="stat-number">{numberOfCampaigns[0]?.total_campaigns}</span>
                        <p>Kampanii zrealizowanych</p>
                    </div>
                    <div className="stat-box">
                        <span className="stat-number">{numberOfInfluencers[0]?.total_influencers}</span>
                        <p>Influencerów</p>
                    </div>
                    <div className="stat-box">
                        <span className="stat-number">{numberOfLikesForAllCampaigns[0]?.total_likes}</span>
                        <p>Polubień</p>
                    </div>
                </div>
            </section> */}

            {/* Opinions */}
            <section className="section section--opinions">
                <h2 className="section__title">Co mówią nasi użytkownicy</h2>
                <div className="opinion">
                    <p>"Dzięki tej platformie zwiększyliśmy nasze zasięgi o 20%! Wszystko w jednym miejscu — genialne!"</p>
                    <span className="author">— Anna, Marketing Manager</span>
                </div>
                <div className="opinion">
                    <p>"Prosty sposób na znalezienie nowych kampanii i monitorowanie efektów. Polecam każdemu influencerowi."</p>
                    <span className="author">— Michał, Influencer</span>
                </div>
            </section>

            {/* Footer */}
        </div>
    );
};