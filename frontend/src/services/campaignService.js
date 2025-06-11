import axios from 'axios';

export async function getTopCampaigns() {
    const res = await axios.get('http://localhost:3001/campaigns/top_campaigns');
    return res.data;
}

export async function getUpcomingCampaigns() {
    const res = await axios.get('http://localhost:3001/campaigns/upcoming_campaigns');
    return res.data;
}

export async function getCompletedCampaigns() {
    const res = await axios.get('http://localhost:3001/campaigns/completed_campaigns');
    return res.data;
}