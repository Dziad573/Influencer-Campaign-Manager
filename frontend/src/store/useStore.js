import { create } from 'zustand';

const useStore = create((set) => ({
    user: null,
    theme: 'light',
    setUser: (user) => set({ user }),
    toggleTheme: () =>
    set((state) => ({ theme: state.theme === 'light' ? 'dark' : 'light' })),
}));

export default useStore;