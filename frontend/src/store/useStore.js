import { create } from 'zustand';

const useStore = create((set) => ({
    user: null,
    theme: 'dark',
    setUser: (user) => set({ user }),
    toggleTheme: () =>
    set((state) => ({ theme: state.theme === 'dark' ? 'light' : 'dark' })),
    
    upcomingCampaigns: [],
    setUpcomingCampaigns: (upcomingCampaigns) => set({ upcomingCampaigns }),

    topCampaigns: [],
    setTopCampaigns: (topCampaigns) => set({ topCampaigns }),
}));

export default useStore;