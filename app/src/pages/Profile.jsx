import React, { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { useAuth } from '../contexts/AuthContext';
import { getProfile } from '../utils/api';

export default function ProfilePage() {
  const { t } = useTranslation();
  const { user: authUser, isAuthenticated, refreshUser } = useAuth();
  const [activeTab, setActiveTab] = useState('chirps');

  const tabs = [
    { key: 'chirps', label: t('profile.chirps') },
    { key: 'replies', label: t('profile.replies') },
    { key: 'likes', label: t('profile.likes') },
  ];

  const displayName = authUser?.nickname || 'You';
  const handle = authUser?.username || '@you';
  const bio = authUser?.bio || '';
  const avatarUrl = authUser?.avatar || 'https://api.dicebear.com/9.x/thumbs/svg?seed=Felix';
  const joinedDate = authUser?.createdAt
    ? new Date(authUser.createdAt).toLocaleDateString('en-US', { month: 'long', year: 'numeric' })
    : 'March 2026';
  const following = authUser?.followingCount || 0;
  const followers = authUser?.followerCount || 0;
  const postCount = authUser?.postCount || 0;

  return (
    <div>
      <header style={styles.header}>
        <h2 style={styles.title}>{displayName}</h2>
        <p style={styles.tweetCount}>{postCount} {t('profile.chirps')}</p>
      </header>

      <div style={styles.banner} />

      <div style={styles.profile}>
        <img src={avatarUrl} alt="" style={styles.avatar} />
        <div style={styles.actions}>
          <button style={styles.editBtn}>{t('profile.editProfile')}</button>
        </div>
        <div style={styles.info}>
          <h3 style={styles.displayName}>{displayName}</h3>
          <p style={styles.handle}>{handle}</p>
          {bio ? <p style={styles.bio}>{bio}</p> : null}
          <div style={styles.meta}>
            <span style={styles.metaItem}>📅 {t('profile.joined')} {joinedDate}</span>
          </div>
          <div style={styles.followRow}>
            <span style={styles.follow}>
              <strong>{following}</strong> {t('profile.following')}
            </span>
            <span style={styles.follow}>
              <strong>{followers}</strong> {t('profile.followers')}
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

      <div style={styles.emptyTab}>
        {isAuthenticated ? (
          <p style={styles.emptyText}>{t('profile.noChirpsYet')}</p>
        ) : (
          <p style={styles.emptyText}>{t('wallet.connect')}</p>
        )}
      </div>
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
  emptyTab: {
    padding: '32px 16px',
    textAlign: 'center',
  },
  emptyText: {
    color: '#536471',
    fontSize: 15,
  },
};
