import { useState, useEffect } from 'react';
import { useTranslation } from 'react-i18next';
import { useNavigate } from 'react-router-dom';
import { getTags, getFeed } from '../utils/api';

export default function Search() {
  const { t } = useTranslation();
  const navigate = useNavigate();
  const [query, setQuery] = useState('');
  const [tags, setTags] = useState([]);
  const [tagPosts, setTagPosts] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    getTags()
      .then((res) => setTags(res.data || []))
      .catch(() => {});
  }, []);

  const handleTagClick = async (tag) => {
    setLoading(true);
    setQuery(tag);
    try {
      const res = await getFeed({ tag, page: 1, pageSize: 20 });
      setTagPosts(res.data.list || []);
    } catch {
      setTagPosts([]);
    } finally {
      setLoading(false);
    }
  };

  const filtered = query
    ? tags.filter((item) => item.tag.toLowerCase().includes(query.toLowerCase()))
    : tags;

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
          onChange={(e) => {
            setQuery(e.target.value);
            setTagPosts([]);
          }}
          style={styles.input}
        />
      </div>

      {!tagPosts.length && !loading && (
        <>
          <div style={styles.sectionHeader}>
            <h3 style={styles.sectionTitle}>{t('search.trends')}</h3>
          </div>
          {filtered.map((item) => (
            <div
              key={item.ID}
              style={styles.trendItem}
              onClick={() => handleTagClick(item.tag)}
            >
              <p style={styles.tagHash}>#{item.tag}</p>
              <p style={styles.posts}>{item.quoteNum} {t('search.posts')}</p>
            </div>
          ))}
        </>
      )}

      {loading && <p style={styles.loading}>Loading...</p>}

      {tagPosts.length > 0 && (
        <div>
          <div style={styles.sectionHeader}>
            <h3 style={styles.sectionTitle}>#{query}</h3>
          </div>
          {tagPosts.map((post) => (
            <div
              key={post.ID}
              style={styles.postItem}
              onClick={() => navigate(`/post/${post.ID}`)}
            >
              <p style={styles.postUser}>@{post.user?.username || '...'}</p>
              <p style={styles.postText}>
                {(post.contents || [])
                  .filter((c) => c.type === 2)
                  .map((c) => c.content)
                  .join(' ')
                  .slice(0, 140)}
              </p>
            </div>
          ))}
        </div>
      )}
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
  tagHash: {
    fontSize: 15,
    fontWeight: 700,
    color: '#0f1419',
    marginBottom: 4,
  },
  posts: {
    fontSize: 13,
    color: '#536471',
  },
  loading: {
    textAlign: 'center',
    color: '#536471',
    padding: '32px 16px',
  },
  postItem: {
    padding: '12px 16px',
    borderBottom: '1px solid #eff3f4',
    cursor: 'pointer',
  },
  postUser: {
    fontSize: 13,
    color: '#536471',
    marginBottom: 4,
  },
  postText: {
    fontSize: 15,
    color: '#0f1419',
  },
};
