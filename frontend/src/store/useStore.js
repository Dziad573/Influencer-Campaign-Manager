import { create } from 'zustand';

const useStore = create((set) => ({
    user: null,
    theme: 'dark',
    setUser: (user) => set({ user }),
    toggleTheme: () =>
    set((state) => ({ theme: state.theme === 'dark' ? 'light' : 'dark' })),

    user: JSON.parse(localStorage.getItem('user')) || null,
    setUser: (user) => set({ user }),
    logout: () => {
        localStorage.removeItem('user');
        set({ user: null });
    },
    
    upcomingCampaigns: [],
    setUpcomingCampaigns: (upcomingCampaigns) => set({ upcomingCampaigns }),

    topCampaigns: [],
    setTopCampaigns: (topCampaigns) => set({ topCampaigns }),
    
    numberOfCampaigns: [],
    setNumberOfCampaigns: (numberOfCampaigns) => set({ numberOfCampaigns }),

    numberOfInfluencers: [],
    setNumberOfInfluencers: (numberOfInfluencers) => set({ numberOfInfluencers }),

    numberOfLikesForAllCampaigns: [],
    setNumberOfLikes: (numberOfLikesForAllCampaigns) => set({ numberOfLikesForAllCampaigns }),
}));

export default useStore;