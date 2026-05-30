import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { toggleLike, toggleCollect, relativeTime, API_BASE } from '../utils/api';
import { useAuth } from '../contexts/AuthContext';

function getAvatar(post) {
  if (post.user?.avatar) return post.user.avatar;
  return `https://api.dicebear.com/9.x/thumbs/svg?seed=${post.user?.username || post.userId}`;
}

function getTextContents(contents) {
  if (!contents) return '';
  return contents
    .filter((c) => c.type === 2 || c.type === 1)
    .sort((a, b) => a.sort - b.sort)
    .map((c) => c.content)
    .join('\n');
}

function getImageContents(contents) {
  if (!contents) return [];
  return contents
    .filter((c) => c.type === 3)
    .sort((a, b) => a.sort - b.sort)
    .map((c) => {
      const url = c.content;
      return url && url.startsWith('/') ? API_BASE + url : url;
    });
}

export default function TweetCard({ post, onLike, onCollect }) {
  const navigate = useNavigate();
  const { isAuthenticated } = useAuth();
  const [liked, setLiked] = useState(false);
  const [collected, setCollected] = useState(false);
  const [likeCount, setLikeCount] = useState(post.upvoteCount || 0);
  const [collectCount, setCollectCount] = useState(post.collectionCount || 0);

  const text = getTextContents(post.contents);
  const images = getImageContents(post.contents);
  const avatar = getAvatar(post);

  const handleLike = async (e) => {
    e.stopPropagation();
    if (!isAuthenticated) return;
    try {
      const res = await toggleLike(post.ID);
      setLiked(res.data.liked);
      setLikeCount((c) => c + (res.data.liked ? 1 : -1));
      if (onLike) onLike(post.ID, res.data.liked);
    } catch {}
  };

  const handleCollect = async (e) => {
    e.stopPropagation();
    if (!isAuthenticated) return;
    try {
      const res = await toggleCollect(post.ID);
      setCollected(res.data.collected);
      setCollectCount((c) => c + (res.data.collected ? 1 : -1));
      if (onCollect) onCollect(post.ID, res.data.collected);
    } catch {}
  };

  const goToPost = () => {
    navigate(`/post/${post.ID}`);
  };

  const goToUser = (e) => {
    e.stopPropagation();
    if (post.user?.ID) navigate(`/profile/${post.user.ID}`);
  };

  return (
    <article style={styles.card} onClick={goToPost}>
      <img src={avatar} alt="" style={styles.avatar} onClick={goToUser} />
      <div style={styles.body}>
        <div style={styles.header}>
          <div style={styles.userInfo}>
            <span style={styles.name} onClick={goToUser}>{post.user?.nickname || 'User'}</span>
            {post.user?.isLive && (
              <span style={styles.liveBadge}>LIVE</span>
            )}
          </div>
          <div style={styles.meta}>
            <span style={styles.handle}>@{post.user?.username || '...'}</span>
            <span style={styles.dot}>·</span>
            <span style={styles.time}>{relativeTime(post.createdAt)}</span>
          </div>
        </div>
        {text && <p style={styles.content}>{text}</p>}
        {images.length > 0 && (
          <div style={styles.images}>
            {images.map((url, i) => (
              <img key={i} src={url} alt="" style={styles.image} />
            ))}
          </div>
        )}
        <div style={styles.actions} onClick={(e) => e.stopPropagation()}>
          <button style={styles.actionBtn} onClick={goToPost} title="Comment">
            <svg width="20" height="20" viewBox="0 0 24 24" fill="#8b95a5">
              <path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366a8.13 8.13 0 0 1 8.129 8.13c0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067A8.005 8.005 0 0 1 1.751 10zM8.005 3.5a6.5 6.5 0 0 0 0 13h1.567v2.51L17.2 14.84a6.63 6.63 0 0 0 3.046-5.66A6.63 6.63 0 0 0 14.122 3.5H8.005z" />
            </svg>
            <span style={styles.actionCount}>{post.commentCount || 0}</span>
          </button>
          <button style={styles.actionBtn} onClick={handleCollect} title="Bookmark">
            <svg width="20" height="20" viewBox="0 0 24 24" fill={collected ? '#764ba2' : '#8b95a5'}>
              <path d="M4 4.5A2.5 2.5 0 0 1 6.5 2H18a2.5 2.5 0 0 1 2.5 2.5v14.44a.5.5 0 0 1-.8.4l-5.7-4.28-5.7 4.28a.5.5 0 0 1-.8-.4V4.5z" />
            </svg>
            <span style={styles.actionCount}>{collectCount}</span>
          </button>
          <button
            style={{ ...styles.actionBtn, color: liked ? '#e91e63' : '#8b95a5' }}
            onClick={handleLike}
            title="Like"
          >
            <svg width="20" height="20" viewBox="0 0 24 24" fill={liked ? '#e91e63' : 'none'} stroke={liked ? '#e91e63' : 'currentColor'} strokeWidth="2">
              <path d="M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.351 4.647 2.529.816-1.178 2.357-2.529 4.647-2.529 2.878 0 5.403 2.69 5.403 5.754 0 6.378-7.453 13.112-10.063 13.16H12z" />
            </svg>
            <span style={styles.actionCount}>{likeCount}</span>
          </button>
        </div>
      </div>
    </article>
  );
}

const styles = {
  card: {
    display: 'flex',
    gap: 12,
    padding: '16px 20px',
    background: '#ffffff',
    cursor: 'pointer',
  },
  avatar: {
    width: 48,
    height: 48,
    borderRadius: '50%',
    flexShrink: 0,
    background: '#f8f9ff',
    cursor: 'pointer',
    border: '2px solid transparent',
    backgroundClip: 'padding-box',
  },
  body: {
    flex: 1,
    minWidth: 0,
  },
  header: {
    display: 'flex',
    flexDirection: 'column',
    gap: 2,
    marginBottom: 8,
  },
  userInfo: {
    display: 'flex',
    alignItems: 'center',
    gap: 8,
  },
  name: {
    fontWeight: 700,
    color: '#1a1a2e',
    fontSize: 15,
    cursor: 'pointer',
  },
  liveBadge: {
    background: 'linear-gradient(135deg, #e91e63 0%, #ff6b9d 100%)',
    color: '#ffffff',
    fontSize: 10,
    fontWeight: 700,
    padding: '2px 8px',
    borderRadius: 9999,
  },
  meta: {
    display: 'flex',
    alignItems: 'center',
    gap: 4,
    fontSize: 13,
  },
  handle: {
    color: '#8b95a5',
  },
  dot: {
    color: '#8b95a5',
  },
  time: {
    color: '#8b95a5',
  },
  content: {
    fontSize: 15,
    lineHeight: 1.6,
    color: '#1a1a2e',
    marginBottom: 12,
    wordBreak: 'break-word',
    whiteSpace: 'pre-wrap',
  },
  images: {
    display: 'flex',
    flexWrap: 'wrap',
    gap: 8,
    marginBottom: 12,
  },
  image: {
    width: '100%',
    maxHeight: 280,
    borderRadius: 16,
    objectFit: 'cover',
  },
  actions: {
    display: 'flex',
    justifyContent: 'space-between',
    maxWidth: 260,
  },
  actionBtn: {
    display: 'flex',
    alignItems: 'center',
    gap: 6,
    padding: 6,
    borderRadius: 9999,
    transition: 'all 0.15s',
    color: '#8b95a5',
  },
  actionCount: {
    fontSize: 13,
    fontWeight: 500,
  },
};
