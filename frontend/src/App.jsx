import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import useStore from './store/useStore';

// Import komponentów
import { HomePage } from './views/HomePage.jsx';
import { CampaignListPage } from './views/CampaignListPage.jsx';
import { CampaignDetailsPage } from './views/CampaignDetailsPage.jsx';
import { InfluencerListPage } from './views/InfluencerListPage.jsx';
import { InfluencerProfilePage } from './views/InfluencerProfilePage.jsx';
import { LoginPage } from './views/LoginPage.jsx';
import { RegisterPage } from './views/RegisterPage.jsx';
import { UserPanelPage } from './views/UserPanelPage.jsx';
import { ReportsPage } from './views/ReportsPage.jsx';
import { AboutPage } from './views/AboutPage.jsx';

export const App = () => {
    const { user } = useStore(); // {email, role, etc.} from Zustand store

    return (
        <Router>
            <Routes>
                <Route path="/" element={<HomePage />} />
                <Route path="/campaigns" element={<CampaignListPage />} />
                <Route path="/campaigns/:id" element={<CampaignDetailsPage />} />
                <Route path="/influencers" element={<InfluencerListPage />} />
                <Route path="/influencers/:id" element={<InfluencerProfilePage />} />
                <Route path="/login" element={user ? <Navigate to="/user-panel" /> : <LoginPage />} />
                <Route path="/register" element={user ? <Navigate to="/user-panel" /> : <RegisterPage />} />
                <Route path="/user-panel" element={user ? <UserPanelPage /> : <Navigate to="/login" />} />
                <Route path="/about" element={<AboutPage />} />
                <Route path="/reports" element={user?.role === 'admin' ? <ReportsPage /> : <Navigate to="/" />} />
            </Routes>
        </Router>
    );
};