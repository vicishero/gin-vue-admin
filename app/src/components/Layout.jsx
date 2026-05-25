import React from 'react';
import { NavLink, useLocation } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { useWallet } from '../hooks/useWallet';

const LANGUAGES = [
  { code: 'en', label: 'English' },
  { code: 'zh', label: '繁體中文' },
  { code: 'ja', label: '日本語' },
];

const navItems = [
  { to: '/home', icon: HomeIcon, key: 'home' },
  { to: '/search', icon: SearchIcon, key: 'search' },
  { to: '/notifications', icon: BellIcon, key: 'notifications' },
  { to: '/profile', icon: UserIcon, key: 'profile' },
];

export default function Layout({ children }) {
  const { t, i18n } = useTranslation();
  const { account, connecting, connectWallet, disconnectWallet } = useWallet();
  const location = useLocation();
  const hideNav = location.pathname === '/';

  const changeLang = (code) => {
    i18n.changeLanguage(code);
    localStorage.setItem('lang', code);
  };

  return (
    <div className="app-container" style={styles.container}>
      <div style={{ ...styles.body, paddingBottom: hideNav ? 0 : 56 }}>
        {/* Top bar with lang switch + wallet */}
        {!hideNav && (
          <div style={styles.topBar}>
            <div style={styles.langRow}>
              {LANGUAGES.map((l) => (
                <button
                  key={l.code}
                  onClick={() => changeLang(l.code)}
                  style={{
                    ...styles.langBtn,
                    color: i18n.language === l.code ? '#e91e63' : '#536471',
                    fontWeight: i18n.language === l.code ? 700 : 400,
                  }}
                >
                  {l.label}
                </button>
              ))}
            </div>
            <button
              onClick={account ? disconnectWallet : connectWallet}
              style={{
                ...styles.walletBtn,
                background: account ? '#f7f9f9' : '#e91e63',
                color: account ? '#0f1419' : '#ffffff',
                border: account ? '1px solid #cfd9de' : 'none',
              }}
            >
              {connecting
                ? t('wallet.connecting')
                : account
                  ? `${account.slice(0, 6)}...${account.slice(-4)}`
                  : t('wallet.connect')}
            </button>
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
            color: isActive ? '#e91e63' : '#536471',
          })}
        >
          <item.icon />
          <span style={styles.navLabel}>{t(`nav.${item.key}`)}</span>
        </NavLink>
      ))}
    </nav>
  );
}

function HomeIcon() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
      <path d="M12 9a3 3 0 0 0-3 3 3 3 0 0 0 3 3 3 3 0 0 0 3-3 3 3 0 0 0-3-3zm0 8a5 5 0 0 1-5-5 5 5 0 0 1 5-5 5 5 0 0 1 5 5 5 5 0 0 1-5 5zm-7 0H3v-5a5 5 0 0 1 5-5h1v2H8a3 3 0 0 0-3 3v5zm12 0h2v-5a5 5 0 0 0-5-5h-1v2h1a3 3 0 0 1 3 3v5z" />
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

function BellIcon() {
  return (
    <svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
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
  topBar: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '8px 16px',
    borderBottom: '1px solid #eff3f4',
    gap: 8,
  },
  langRow: {
    display: 'flex',
    gap: 4,
  },
  langBtn: {
    fontSize: 12,
    padding: '4px 8px',
    borderRadius: 9999,
    background: 'transparent',
    border: 'none',
  },
  walletBtn: {
    fontSize: 13,
    fontWeight: 600,
    padding: '8px 16px',
    borderRadius: 9999,
    whiteSpace: 'nowrap',
  },
  nav: {
    position: 'fixed',
    bottom: 0,
    left: '50%',
    transform: 'translateX(-50%)',
    width: '100%',
    maxWidth: 500,
    height: 56,
    display: 'flex',
    justifyContent: 'space-around',
    alignItems: 'center',
    background: '#ffffff',
    borderTop: '1px solid #eff3f4',
    zIndex: 100,
    paddingBottom: 'env(safe-area-inset-bottom)',
  },
  navItem: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    gap: 2,
    textDecoration: 'none',
    padding: '4px 12px',
    transition: 'color 0.15s',
  },
  navLabel: {
    fontSize: 10,
    fontWeight: 500,
  },
};
