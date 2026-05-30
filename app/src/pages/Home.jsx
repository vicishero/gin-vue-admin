import { useState, useEffect, useCallback } from 'react';
import { useTranslation } from 'react-i18next';
import { getFeed } from '../utils/api';
import { useAuth } from '../contexts/AuthContext';
import TweetCard from '../components/TweetCard';
import TweetComposer from '../components/TweetComposer';

const TABS = [
  { key: 'recommend', label: '推薦' },
  { key: 'following', label: '關注' },
  { key: 'newest', label: '最新' },
  { key: 'activity', label: '活動' },
];

export default function Home() {
  const { t } = useTranslation();
  const { isAuthenticated } = useAuth();
  const [tab, setTab] = useState('recommend');
  const [posts, setPosts] = useState([]);
  const [loading, setLoading] = useState(false);
  const [page, setPage] = useState(1);
  const [total, setTotal] = useState(0);
  const [error, setError] = useState('');

  const fetchFeed = useCallback(async (tabKey, pageNum, append) => {
    setLoading(true);
    setError('');
    try {
      const res = await getFeed({ type: tabKey, page: pageNum, pageSize: 20 });
      const list = res.data.list || [];
      if (append) {
        setPosts((prev) => [...prev, ...list]);
      } else {
        setPosts(list);
      }
      setTotal(res.data.total || 0);
    } catch (e) {
      setError(e.message);
      if (!append) setPosts([]);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    setPage(1);
    fetchFeed(tab, 1, false);
  }, [tab, fetchFeed]);

  const handleNewTweet = (post) => {
    setPosts((prev) => [post, ...prev]);
  };

  const loadMore = () => {
    const next = page + 1;
    setPage(next);
    fetchFeed(tab, next, true);
  };

  const hasMore = posts.length < total;

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <h2 style={styles.title}>HOME</h2>
      </div>

      <div style={styles.tabs}>
        {TABS.map((item) => (
          <button
            key={item.key}
            onClick={() => setTab(item.key)}
            style={{
              ...styles.tab,
              ...(tab === item.key ? styles.tabActive : {}),
            }}
          >
            {item.label}
          </button>
        ))}
      </div>

      {isAuthenticated && <TweetComposer onTweet={handleNewTweet} />}

      {error && <p style={styles.empty}>{error}</p>}

      {!loading && !error && posts.length === 0 && (
        <p style={styles.empty}>{t('home.empty')}</p>
      )}

      {posts.map((post) => (
        <TweetCard key={post.ID} post={post} />
      ))}

      {loading && <p style={styles.loading}>Loading...</p>}

      {hasMore && !loading && (
        <button onClick={loadMore} style={styles.loadMore}>
          {t('home.loadMore')}
        </button>
      )}
    </div>
  );
}

const styles = {
  container: {
    background: '#ffffff',
  },
  header: {
    padding: '0 20px 12px',
  },
  title: {
    fontSize: 18,
    fontWeight: 800,
    color: '#1a1a2e',
  },
  tabs: {
    display: 'flex',
    gap: 8,
    padding: '0 20px 16px',
    overflowX: 'auto',
  },
  tab: {
    padding: '8px 16px',
    fontSize: 13,
    fontWeight: 600,
    background: '#f8f9ff',
    color: '#8b95a5',
    borderRadius: 9999,
    border: 'none',
    cursor: 'pointer',
    whiteSpace: 'nowrap',
    transition: 'all 0.2s',
  },
  tabActive: {
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
    color: '#ffffff',
  },
  empty: {
    textAlign: 'center',
    color: '#8b95a5',
    padding: '32px 20px',
    fontSize: 15,
  },
  loading: {
    textAlign: 'center',
    color: '#8b95a5',
    padding: '16px',
    fontSize: 14,
  },
  loadMore: {
    width: '100%',
    padding: '12px',
    background: 'transparent',
    border: 'none',
    color: '#764ba2',
    fontSize: 14,
    fontWeight: 600,
    cursor: 'pointer',
  },
};
