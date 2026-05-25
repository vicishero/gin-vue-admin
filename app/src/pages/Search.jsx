import React, { useState } from 'react';
import { useTranslation } from 'react-i18next';

const TRENDING = [
  { id: 1, category: 'Technology · Trending', topic: '#ReactJS', posts: '124K' },
  { id: 2, category: 'Technology · Trending', topic: '#TypeScript', posts: '89K' },
  { id: 3, category: 'Gaming · Trending', topic: '#EldenRing', posts: '56K' },
  { id: 4, category: 'Music · Trending', topic: '#NewMusic', posts: '312K' },
  { id: 5, category: 'Sports · Trending', topic: '#NBAFinals', posts: '198K' },
  { id: 6, category: 'Entertainment', topic: '#Oscars2026', posts: '245K' },
  { id: 7, category: 'Technology', topic: '#OpenSource', posts: '67K' },
  { id: 8, category: 'Design', topic: '#UIDesign', posts: '43K' },
];

export default function Search() {
  const { t } = useTranslation();
  const [query, setQuery] = useState('');

  const filtered = query
    ? TRENDING.filter((item) => item.topic.toLowerCase().includes(query.toLowerCase()))
    : TRENDING;

  return (
    <div>
      <header style={styles.header}>
        <h2 style={styles.title}>{t('search.title')}</h2>
      </header>
      <div style={styles.searchBar}>
        <svg width="18" height="18" viewBox="0 0 24 24" fill="#536471" style={styles.searchIcon}>
          <path d="M10.25 3.75a6.5 6.5 0 1 0 0 13 6.5 6.5 0 0 0 0-13zm-8.5 6.5a8.5 8.5 0 1 1 15.176 5.262l4.656 4.656-1.414 1.414-4.656-4.656A8.5 8.5 0 0 1 1.75 10.25z" />
        </svg>
        <input
          type="text"
          placeholder={t('search.placeholder')}
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          style={styles.input}
        />
      </div>

      {!query && (
        <div style={styles.sectionHeader}>
          <h3 style={styles.sectionTitle}>{t('search.trends')}</h3>
        </div>
      )}

      {filtered.map((item) => (
        <div key={item.id} style={styles.trendItem}>
          <p style={styles.category}>{item.category}</p>
          <p style={styles.topic}>{item.topic}</p>
          <p style={styles.posts}>{item.posts} {t('search.posts')}</p>
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
  searchBar: {
    display: 'flex',
    alignItems: 'center',
    gap: 12,
    margin: '12px 16px',
    padding: '10px 16px',
    background: '#f7f9f9',
    borderRadius: 9999,
    border: '1px solid transparent',
  },
  searchIcon: {
    flexShrink: 0,
  },
  input: {
    flex: 1,
    border: 'none',
    outline: 'none',
    background: 'transparent',
    fontSize: 15,
    color: '#0f1419',
  },
  sectionHeader: {
    padding: '12px 16px',
    borderBottom: '1px solid #eff3f4',
  },
  sectionTitle: {
    fontSize: 18,
    fontWeight: 800,
    color: '#0f1419',
  },
  trendItem: {
    padding: '12px 16px',
    borderBottom: '1px solid #eff3f4',
    cursor: 'pointer',
  },
  category: {
    fontSize: 13,
    color: '#536471',
    marginBottom: 2,
  },
  topic: {
    fontSize: 15,
    fontWeight: 700,
    color: '#0f1419',
    marginBottom: 4,
  },
  posts: {
    fontSize: 13,
    color: '#536471',
  },
};
