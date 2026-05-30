import { useEffect, useCallback, useState } from 'react';
import { NavLink, useLocation } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useWallet } from '../hooks/useWallet';
import { useAuth } from '../contexts/AuthContext';

const LANGUAGES = [
  { code: 'en', label: 'English' },
  { code: 'zh', label: '繁體中文' },
  { code: 'ja', label: '日本語' },
];

const navItems = [
  { to: '/home', icon: HomeIcon, key: 'home' },
  { to: '/search', icon: SearchIcon, key: 'search' },
  { to: '/compose', icon: PlusIcon, key: 'compose', isCenter: true },
  { to: '/notifications', icon: MessageIcon, key: 'notifications' },
  { to: '/profile', icon: UserIcon, key: 'profile' },
];

export default function Layout({ children }) {
  const { t, i18n } = useTranslation();
  const { account, connecting, connectWallet, disconnectWallet, signMessage } = useWallet();
  const { isAuthenticated, login, logout, user } = useAuth();
  const location = useLocation();
  const hideNav = location.pathname === '/';
  const [loginError, setLoginError] = useState('');

  const changeLang = (code) => {
    i18n.changeLanguage(code);
    localStorage.setItem('lang', code);
  };

  const handleWalletClick = useCallback(async () => {
    if (account) {
      disconnectWallet();
      logout();
      localStorage.removeItem('h5_token');
    } else {
      setLoginError('');
      await connectWallet();
    }
  }, [account, connectWallet, disconnectWallet, login, logout, signMessage, isAuthenticated]);

  useEffect(() => {
    if (account && !isAuthenticated && !connecting) {
      login(account, signMessage).catch((e) => setLoginError(e.message || 'Login failed'));
    }
  }, [account, connecting, isAuthenticated, login, signMessage]);

  const btnLabel = connecting
    ? t('wallet.connecting')
    : isAuthenticated
      ? (user?.nickname || account?.slice(0, 6) + '...' + account?.slice(-4))
      : account
        ? t('wallet.connecting')
        : t('wallet.connect');

  return (
    <div className="app-container" style={styles.container}>
      <div style={{ ...styles.body, paddingBottom: hideNav ? 0 : 72 }}>
        {!hideNav && (
          <>
            <div style={styles.statusBar}>
              <span style={styles.statusTime}>9:41</span>
              <div style={styles.statusRight}>
                <span style={styles.statusIcon}>📶</span>
                <span style={styles.statusIcon}>🔋</span>
              </div>
            </div>
            <div style={styles.topBar}>
              <div style={styles.logoSection}>
                <div style={styles.logoIcon}>
                  <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                    <path d="M12 2L22 12L12 22L2 12L12 2Z" fill="url(#logoGradient)" />
                    <defs>
                      <linearGradient id="logoGradient" x1="2" y1="12" x2="22" y2="12" gradientUnits="userSpaceOnUse">
                        <stop stopColor="#667EEA" />
                        <stop offset="0.5" stopColor="#764BA2" />
                        <stop offset="1" stopColor="#E91E63" />
                      </linearGradient>
                    </defs>
                  </svg>
                </div>
                <span style={styles.logoText}>MIRIVERSE</span>
              </div>
              <div style={styles.topActions}>
                <button style={styles.iconBtn}>
                  <svg width="22" height="22" viewBox="0 0 24 24" fill="none">
                    <path d="M12 2L22 12L12 22L2 12L12 2Z" fill="url(#gemGradient)" />
                    <defs>
                      <linearGradient id="gemGradient" x1="2" y1="12" x2="22" y2="12" gradientUnits="userSpaceOnUse">
                        <stop stopColor="#667EEA" />
                        <stop offset="1" stopColor="#764BA2" />
                      </linearGradient>
                    </defs>
                  </svg>
                </button>
                <button style={styles.iconBtn}>
                  <BellIcon />
                </button>
              </div>
            </div>
          </>
        )}
        {loginError && (
          <div style={styles.authBanner}>
            <span>{loginError}</span>
            <button onClick={() => setLoginError('')} style={styles.authBannerClose}>x</button>
          </div>
        )}
        {children}
      </div>
      {!hideNav && <BottomNav t={t} />}
    </div>
  );
}

function BottomNav({ t }) {
  return (
    <nav style={styles.nav}>
      {navItems.map((item) => (
        <NavLink
          key={item.to}
          to={item.to}
          style={({ isActive }) => ({
            ...styles.navItem,
            ...(item.isCenter ? styles.navCenter : {}),
            color: isActive ? '#764BA2' : '#8B95A5',
          })}
        >
          {item.isCenter ? (
            <div style={styles.centerBtn}>
              <item.icon />
            </div>
          ) : (
            <item.icon />
          )}
          {!item.isCenter && <span style={styles.navLabel}>{t(`nav.${item.key}`)}</span>}
        </NavLink>
      ))}
    </nav>
  );
}

function HomeIcon() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
      <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z" />
    </svg>
  );
}

function SearchIcon() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
      <path d="M10.25 3.75a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13zm-8.5 6.5a8.5 8.5 0 1 1 15.176 5.262l4.656 4.656-1.414 1.414-4.656-4.656A8.5 8.5 0 0 1 1.75 10.25z" />
    </svg>
  );
}

function PlusIcon() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="white">
      <path d="M12 5v14M5 12h14" stroke="white" strokeWidth="2.5" strokeLinecap="round" />
    </svg>
  );
}

function MessageIcon() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
      <path d="M20 2H4C2.9 2 2 2.9 2 4V22L6 18H20C21.1 18 22 17.1 22 16V4C22 2.9 21.1 2 20 2Z" />
    </svg>
  );
}

function BellIcon() {
  return (
    <svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor">
      <path d="M11.996 1.5c-4.138 0-7.496 3.358-7.496 7.496v3.836L2.754 14.58a1.75 1.75 0 0 0 1.237 2.988H8.28a3.75 3.75 0 0 0 7.44 0h4.288a1.75 1.75 0 0 0 1.237-2.988L19.5 12.832V8.996c0-4.138-3.358-7.496-7.496-7.496h-.008zM12 19.5a2.25 2.25 0 0 1-2.212-1.932h4.424A2.25 2.25 0 0 1 12 19.5z" />
    </svg>
  );
}

function UserIcon() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
      <path d="M12 2a4.5 4.5 0 1 0 0 9 4.5 4.5 0 0 0 0-9zM5.5 18.5A6.5 6.5 0 0 1 12 12a6.5 6.5 0 0 1 6.5 6.5V20h-13v-1.5z" />
    </svg>
  );
}

const styles = {
  container: {
    display: 'flex',
    flexDirection: 'column',
    minHeight: '100vh',
    minHeight: '100dvh',
    background: '#ffffff',
  },
  body: {
    flex: 1,
  },
  statusBar: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '8px 20px',
    fontSize: 14,
    fontWeight: 600,
  },
  statusTime: {
    fontWeight: 600,
  },
  statusRight: {
    display: 'flex',
    gap: 4,
  },
  statusIcon: {
    fontSize: 14,
  },
  topBar: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '12px 20px',
    background: '#ffffff',
  },
  logoSection: {
    display: 'flex',
    alignItems: 'center',
    gap: 8,
  },
  logoIcon: {
    width: 32,
    height: 32,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  logoText: {
    fontSize: 20,
    fontWeight: 800,
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 50%, #e91e63 100%)',
    WebkitBackgroundClip: 'text',
    WebkitTextFillColor: 'transparent',
    backgroundClip: 'text',
  },
  topActions: {
    display: 'flex',
    gap: 12,
    alignItems: 'center',
  },
  iconBtn: {
    padding: 6,
    borderRadius: 9999,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    color: '#536471',
  },
  nav: {
    position: 'fixed',
    bottom: 0,
    left: '50%',
    transform: 'translateX(-50%)',
    width: '100%',
    maxWidth: 500,
    height: 72,
    display: 'flex',
    justifyContent: 'space-around',
    alignItems: 'center',
    background: '#ffffff',
    borderTop: '1px solid #f0f2f8',
    boxShadow: '0 -4px 20px rgba(102, 126, 234, 0.08)',
    zIndex: 100,
    paddingBottom: 'env(safe-area-inset-bottom)',
  },
  navItem: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 4,
    textDecoration: 'none',
    padding: '8px 16px',
    transition: 'color 0.15s',
  },
  navCenter: {
    transform: 'translateY(-12px)',
  },
  centerBtn: {
    width: 56,
    height: 56,
    borderRadius: '50%',
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 50%, #e91e63 100%)',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    boxShadow: '0 4px 15px rgba(118, 75, 162, 0.4)',
  },
  navLabel: {
    fontSize: 11,
    fontWeight: 500,
  },
  authBanner: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '10px 16px',
    background: '#fff3cd',
    color: '#856404',
    fontSize: 13,
    borderBottom: '1px solid #ffeaa7',
  },
  authBannerClose: {
    background: 'none',
    border: 'none',
    fontSize: 16,
    cursor: 'pointer',
    color: '#856404',
    padding: '0 4px',
  },
};
