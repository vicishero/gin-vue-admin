import React from 'react';
import { useTranslation } from 'react-i18next';

function LikeIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="#e91e63">
      <path d="M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.351 4.647 2.529.816-1.178 2.357-2.529 4.647-2.529 2.878 0 5.403 2.69 5.403 5.754 0 6.378-7.453 13.112-10.063 13.16H12z" />
    </svg>
  );
}

function RetweetIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="#e91e63">
      <path d="M4.75 3.79l4.603 4.3-1.706 1.82L6 8.38v7.37c0 .97.784 1.75 1.75 1.75H13v2H7.75c-2.072 0-3.75-1.68-3.75-3.75V8.38l-1.647 1.53-1.706-1.82L4.75 3.79zM19.25 20.21l-4.603-4.3 1.706-1.82L18 15.62V8.25c0-.97-.784-1.75-1.75-1.75H11v-2h5.25c2.072 0 3.75 1.68 3.75 3.75v7.37l1.647-1.53 1.706 1.82-4.603 4.3z" />
    </svg>
  );
}

function FollowIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="#e91e63">
      <path d="M12 2a4.5 4.5 0 1 0 0 9 4.5 4.5 0 0 0 0-9zM5.5 18.5A6.5 6.5 0 0 1 12 12a6.5 6.5 0 0 1 6.5 6.5V20h-13v-1.5z" />
    </svg>
  );
}

function CommentIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="#e91e63">
      <path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366a8.13 8.13 0 0 1 8.129 8.13c0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067A8.005 8.005 0 0 1 1.751 10z" />
    </svg>
  );
}

export default function Notifications() {
  const { t } = useTranslation();

  const NOTIFICATIONS = [
    { id: 1, icon: LikeIcon, text: `Felix ${t('notifications.likedYourChirp')}`, time: '2m', highlight: false },
    { id: 2, icon: RetweetIcon, text: `Aneka ${t('notifications.repostedYourChirp')}`, time: '15m', highlight: false },
    { id: 3, icon: FollowIcon, text: `Salem Codes ${t('notifications.followedYou')}`, time: '1h', highlight: true },
    { id: 4, icon: CommentIcon, text: `Midnight Dev ${t('notifications.repliedYourChirp')}`, time: '2h', highlight: false },
    { id: 5, icon: LikeIcon, text: `Cleo Bytes ${t('notifications.andOthersLiked', { count: 12 })}`, time: '3h', highlight: true },
  ];

  return (
    <div>
      <header style={styles.header}>
        <h2 style={styles.title}>{t('notifications.title')}</h2>
      </header>
      {NOTIFICATIONS.map((n) => (
        <div
          key={n.id}
          style={{
            ...styles.item,
            background: n.highlight ? '#fff0f5' : '#ffffff',
          }}
        >
          <div style={styles.iconWrap}>
            <n.icon />
          </div>
          <div style={styles.content}>
            <p style={styles.text}>{n.text}</p>
            <p style={styles.time}>{n.time}</p>
          </div>
        </div>
      ))}
    </div>
  );
}

const styles = {
  header: {
    padding: '16px',
    borderBottom: '1px solid #eff3f4',
    position: 'sticky',
    top: 0,
    background: 'rgba(255,255,255,0.85)',
    backdropFilter: 'blur(12px)',
    zIndex: 10,
  },
  title: {
    fontSize: 20,
    fontWeight: 800,
    color: '#0f1419',
  },
  item: {
    display: 'flex',
    alignItems: 'flex-start',
    gap: 12,
    padding: '14px 16px',
    borderBottom: '1px solid #eff3f4',
  },
  iconWrap: {
    width: 36,
    height: 36,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
    flexShrink: 0,
  },
  content: {
    flex: 1,
  },
  text: {
    fontSize: 15,
    color: '#0f1419',
  },
  time: {
    fontSize: 13,
    color: '#536471',
    marginTop: 2,
  },
};
