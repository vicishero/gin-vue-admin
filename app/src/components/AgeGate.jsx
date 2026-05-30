import { useState } from 'react';

const STORAGE_KEY = 'age_confirmed';

export default function AgeGate({ children }) {
  const [confirmed, setConfirmed] = useState(() => {
    return localStorage.getItem(STORAGE_KEY) === '1';
  });

  if (confirmed) return children;

  return (
    <div style={styles.overlay}>
      <div style={styles.card}>
        <h1 style={styles.title}>警告</h1>
        <p style={styles.content}>用户是否已经年满18岁？</p>
        <div style={styles.buttons}>
          <button
            style={styles.underage}
            onClick={() => {
              window.location.href = 'https://www.google.com';
            }}
          >
            未满18岁
          </button>
          <button
            style={styles.enter}
            onClick={() => {
              localStorage.setItem(STORAGE_KEY, '1');
              setConfirmed(true);
            }}
          >
            已满18岁，进入
          </button>
        </div>
      </div>
    </div>
  );
}

const styles = {
  overlay: {
    position: 'fixed',
    inset: 0,
    zIndex: 9999,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    background: 'rgba(0,0,0,0.85)',
    padding: 24,
  },
  card: {
    background: '#ffffff',
    borderRadius: 16,
    padding: '32px 24px',
    maxWidth: 340,
    width: '100%',
    textAlign: 'center',
    boxShadow: '0 8px 40px rgba(0,0,0,0.3)',
  },
  title: {
    fontSize: 24,
    fontWeight: 800,
    color: '#d32f2f',
    marginBottom: 16,
  },
  content: {
    fontSize: 17,
    color: '#0f1419',
    lineHeight: 1.6,
    marginBottom: 28,
  },
  buttons: {
    display: 'flex',
    flexDirection: 'column',
    gap: 12,
  },
  underage: {
    width: '100%',
    padding: '14px 0',
    borderRadius: 9999,
    border: '2px solid #cfd9de',
    background: '#ffffff',
    color: '#536471',
    fontSize: 16,
    fontWeight: 600,
    cursor: 'pointer',
  },
  enter: {
    width: '100%',
    padding: '14px 0',
    borderRadius: 9999,
    border: 'none',
    background: '#e91e63',
    color: '#ffffff',
    fontSize: 16,
    fontWeight: 700,
    cursor: 'pointer',
  },
};
