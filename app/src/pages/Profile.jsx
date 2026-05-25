import React, { useState } from 'react';
import { useTranslation } from 'react-i18next';

const CURRENT_USER = {
  name: 'You',
  handle: '@you',
  bio: 'Building things for the web. Chirping about tech, design, and life.',
  joined: 'March 2026',
  following: 142,
  followers: 389,
};

const MY_TWEETS = [
  {
    id: 101,
    content: 'Just started using Chirp — this platform is going to be huge! 🔥',
    time: '2d',
    likes: 24,
    comments: 3,
  },
  {
    id: 102,
    content: 'Working on a new React project. Vite makes everything so fast.',
    time: '4d',
    likes: 18,
    comments: 5,
  },
  {
    id: 103,
    content: 'Beautiful morning, perfect day to write some code.',
    time: '6d',
    likes: 42,
    comments: 7,
  },
];

export default function Profile() {
  const { t } = useTranslation();
  const [activeTab, setActiveTab] = useState('chirps');

  const tabs = [
    { key: 'chirps', label: t('profile.chirps') },
    { key: 'replies', label: t('profile.replies') },
    { key: 'likes', label: t('profile.likes') },
  ];

  return (
    <div>
      <header style={styles.header}>
        <h2 style={styles.title}>{CURRENT_USER.name}</h2>
        <p style={styles.tweetCount}>3 {t('profile.chirps')}</p>
      </header>

      <div style={styles.banner} />

      <div style={styles.profile}>
        <img
          src="https://api.dicebear.com/9.x/thumbs/svg?seed=Felix"
          alt=""
          style={styles.avatar}
        />
        <div style={styles.actions}>
          <button style={styles.editBtn}>{t('profile.editProfile')}</button>
        </div>
        <div style={styles.info}>
          <h3 style={styles.displayName}>{CURRENT_USER.name}</h3>
          <p style={styles.handle}>{CURRENT_USER.handle}</p>
          <p style={styles.bio}>{CURRENT_USER.bio}</p>
          <div style={styles.meta}>
            <span style={styles.metaItem}>📅 {t('profile.joined')} {CURRENT_USER.joined}</span>
          </div>
          <div style={styles.followRow}>
            <span style={styles.follow}>
              <strong>{CURRENT_USER.following}</strong> {t('profile.following')}
            </span>
            <span style={styles.follow}>
              <strong>{CURRENT_USER.followers}</strong> {t('profile.followers')}
            </span>
          </div>
        </div>
      </div>

      <div style={styles.tabs}>
        {tabs.map((tab) => (
          <button
            key={tab.key}
            onClick={() => setActiveTab(tab.key)}
            style={{
              ...styles.tab,
              fontWeight: activeTab === tab.key ? 700 : 500,
              color: activeTab === tab.key ? '#0f1419' : '#536471',
              borderBottom: activeTab === tab.key ? '3px solid #e91e63' : '3px solid transparent',
            }}
          >
            {tab.label}
          </button>
        ))}
      </div>

      {MY_TWEETS.map((tweet) => (
        <div key={tweet.id} style={styles.tweet}>
          <div style={styles.tweetHeader}>
            <span style={styles.tweetName}>{CURRENT_USER.name}</span>
            <span style={styles.tweetHandle}>{CURRENT_USER.handle}</span>
            <span style={styles.tweetDot}>·</span>
            <span style={styles.tweetTime}>{tweet.time}</span>
          </div>
          <p style={styles.tweetContent}>{tweet.content}</p>
          <div style={styles.tweetActions}>
            <span style={styles.tweetAction}>💬 {tweet.comments}</span>
            <span style={styles.tweetAction}>❤️ {tweet.likes}</span>
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
  tweetCount: {
    fontSize: 13,
    color: '#536471',
    marginTop: 2,
  },
  banner: {
    height: 120,
    background: 'linear-gradient(135deg, #f8bbd0, #e91e63)',
  },
  profile: {
    padding: '0 16px',
    position: 'relative',
  },
  avatar: {
    width: 72,
    height: 72,
    borderRadius: '50%',
    border: '3px solid #ffffff',
    marginTop: -36,
    background: '#f7f9f9',
  },
  actions: {
    display: 'flex',
    justifyContent: 'flex-end',
    marginTop: -36,
  },
  editBtn: {
    border: '1px solid #cfd9de',
    color: '#0f1419',
    fontWeight: 700,
    fontSize: 14,
    padding: '8px 20px',
    borderRadius: 9999,
    background: 'transparent',
  },
  info: {
    marginTop: 12,
  },
  displayName: {
    fontSize: 20,
    fontWeight: 800,
    color: '#0f1419',
  },
  handle: {
    fontSize: 15,
    color: '#536471',
  },
  bio: {
    fontSize: 15,
    color: '#0f1419',
    marginTop: 10,
  },
  meta: {
    display: 'flex',
    gap: 12,
    marginTop: 10,
    flexWrap: 'wrap',
  },
  metaItem: {
    fontSize: 14,
    color: '#536471',
  },
  followRow: {
    display: 'flex',
    gap: 16,
    marginTop: 10,
  },
  follow: {
    fontSize: 14,
    color: '#536471',
  },
  tabs: {
    display: 'flex',
    borderBottom: '1px solid #eff3f4',
    marginTop: 16,
  },
  tab: {
    flex: 1,
    textAlign: 'center',
    padding: '14px 0',
    fontSize: 15,
    background: 'transparent',
    border: 'none',
    transition: 'color 0.15s',
  },
  tweet: {
    padding: '16px',
    borderBottom: '1px solid #eff3f4',
  },
  tweetHeader: {
    display: 'flex',
    alignItems: 'center',
    gap: 4,
    marginBottom: 4,
    fontSize: 14,
  },
  tweetName: {
    fontWeight: 700,
    color: '#0f1419',
  },
  tweetHandle: {
    color: '#536471',
  },
  tweetDot: {
    color: '#536471',
  },
  tweetTime: {
    color: '#536471',
  },
  tweetContent: {
    fontSize: 15,
    lineHeight: 1.5,
    color: '#0f1419',
    marginBottom: 10,
  },
  tweetActions: {
    display: 'flex',
    gap: 24,
  },
  tweetAction: {
    fontSize: 14,
    color: '#536471',
  },
};
