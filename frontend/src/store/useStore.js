import { create } from 'zustand';

const useStore = create((set) => ({
    user: JSON.parse(localStorage.getItem('user')) || null,
    
    setUser: (user) => {
        localStorage.setItem('user', JSON.stringify(user));
        set({ user });
    },

    logout: () => {
        localStorage.removeItem('user');
        set({ user: null });
    },

    theme: 'dark',
    toggleTheme: () =>
        set((state) => ({ theme: state.theme === 'dark' ? 'light' : 'dark' })),

    completedCampaigns: [],
    setCompletedCampaigns: (completedCampaigns) => set({ completedCampaigns }),

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
