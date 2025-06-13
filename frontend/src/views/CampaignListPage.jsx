import React, { useEffect } from 'react';
import useStore from '../store/useStore';
import { getTopCampaigns, getUpcomingCampaigns, getCompletedCampaigns } from '../services/campaignService';

import './home.scss';

export const CampaignListPage = () => {
        
    const { 
        setUser,
        setCompletedCampaigns,
        setUpcomingCampaigns,
        setTopCampaigns,
        setNumberOfCampaigns,
        
        user,
        completedCampaigns,
        upcomingCampaigns,
        topCampaigns,
        numberOfCampaigns,
        numberOfInfluencers,
        numberOfLikesForAllCampaigns,

    } = useStore();


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

        useEffect(() => {
        async function fetchData() {
            const data = await getCompletedCampaigns();
            setCompletedCampaigns(data);
        }

        fetchData();
    }, []);

    return (
        <div className="homepage">
            <section className="hero">
                <div className="hero__overlay">
                <h1 className="hero__title">CampaignListPage</h1>
                <p className="hero__subtitle">CampaignListPage</p>
                <p className="hero__cta">Rozpocznij teraz</p>
                </div>
            </section>
        

        {/* Top Campaigns */}
            
            <section className="section section--top-campaigns">
                <h2 className="section__title">Top Kampanie</h2>
                <div className="campaigns">
                {topCampaigns.map(effect => (
                    <div key={effect.effect_id} className="campaign-card">
                        <h3>{effect.name}</h3>
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

            <section className="section section--top-campaigns">
                <h2 className="section__title">Zrealizowane kampanie</h2>
                <div className="campaigns">
                    <ul className="upcoming-list">
                        {completedCampaigns.map(camp => (
                            <li key={camp.campaign_id} className="upcoming-list__item">
                                <span>{camp.name}</span> — <span>{camp.start_date}</span>
                                <p>Opis: {camp.description}</p>
                                <p>Data rozpoczęcia: {camp.start_date}</p>
                                <p>Data zakończenia: {camp.end_date}</p>
                                    Influencerzy:
                                        <ul>
                                            <div>
                                                {camp.CampaignInfluencers && camp.CampaignInfluencers.length > 0 && (
                                                    camp.CampaignInfluencers.map(influencer => (
                                                        <li key={influencer.influencer_id} className="influencer-name"> 
                                                            <p>{influencer.Influencer.first_name } {influencer.Influencer.last_name}</p>
                                                            
                                                        </li>
                                                    ))
                                                    
                                                )}
                                            </div>
                                            <div>
                                                {camp.CampaignEffects?.map(effect => (
                                                    <div key={effect.effect_id}>
                                                        <p>Wyświetlenia: {effect.views}</p>
                                                        <p>Polubienia: {effect.likes}</p>
                                                        <p>Komentarze: {effect.comments}</p>
                                                        <p>Udostępnienia: {effect.shares}</p>
                                                        <p>Raport z: {effect.report_date}</p>
                                                    </div>
                                                ))}
                                            </div>
                                        </ul>
                                    
                            </li>
                        ))}
                    </ul>
                </div>
            </section>
        </div>
    );
};