import React from 'react';
import useStore from '../../store/useStore';
import { Link } from 'react-router-dom';
import './TopBar.scss';
export const TopBar = () => {
    const { user, logout } = useStore();

    const handleLogout = () => {
        logout();
    };

    const [isMenuOpen, setIsMenuOpen] = React.useState(false);
    const toggleMenu = () => {
        setIsMenuOpen(!isMenuOpen);
    };

    return (
        <div className="top-bar">
            <h1 className="top-bar__title">TopBar</h1>

                <div className="top-bar__nav">
                    <Link to="/"><button className="top-bar__button">Home <span></span></button></Link>
                    <Link to="/campaigns"><button className="top-bar__button">Kampanie</button></Link>
                    <Link to="/influencers"><button className="top-bar__button">Influencerzy</button></Link>
                    <Link to="/about"><button className="top-bar__button">O nas</button></Link>
                    {user != null && user.role == 'admin' && (
                        <Link to="/reports">
                            <button className="top-bar__button">Raporty</button>
                        </Link>
                    )}
                    {!user ? (
                        <div>
                            <Link to="/login">
                                <button className="top-bar__button">Zaloguj</button>
                            </Link>
                            <Link to="/register">
                                <button className="top-bar__button">Zarejestruj</button>
                            </Link>
                        </div>
                    ) : (
                        <div className='top-bar__user'>
                                <button className="top-bar__button" onClick={() => toggleMenu()}>
                                    Pa
                                </button>
                            {isMenuOpen && (
                                <div className="top-bar__dropdown">
                                    <h2 className="top-bar__name">Użytkownik: {user.email}</h2>
                                    <Link to="/user-panel">
                                        <button className="top-bar__button">Panel użytkownika</button>
                                    </Link>
                                    <Link to="/login">
                                        <button className="top-bar__button" onClick={handleLogout}>Wyloguj</button>
                                    </Link>
                                </div>
                            )}
                        </div>
                    )}
                </div>

        </div>
    );
}