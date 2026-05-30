import { useState, useEffect, useCallback } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { getPost, getComments, createComment, createReply, deleteComment as delComment, relativeTime } from '../utils/api';
import { useAuth } from '../contexts/AuthContext';
import TweetCard from '../components/TweetCard';

export default function PostDetail() {
  const { t } = useTranslation();
  const { id } = useParams();
  const navigate = useNavigate();
  const { isAuthenticated, user } = useAuth();
  const [post, setPost] = useState(null);
  const [comments, setComments] = useState([]);
  const [loading, setLoading] = useState(true);
  const [commentText, setCommentText] = useState('');
  const [submitting, setSubmitting] = useState(false);
  const [replyTo, setReplyTo] = useState(null);
  const [replyText, setReplyText] = useState('');

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const [postRes, commentRes] = await Promise.all([
        getPost(id),
        getComments(id, { page: 1, pageSize: 50 }),
      ]);
      setPost(postRes.data);
      setComments(commentRes.data.list || []);
    } catch {
      navigate('/home', { replace: true });
    } finally {
      setLoading(false);
    }
  }, [id, navigate]);

  useEffect(() => { load(); }, [load]);

  const handleComment = async () => {
    if (!commentText.trim() || submitting) return;
    setSubmitting(true);
    try {
      const res = await createComment(Number(id), commentText.trim());
      setComments((prev) => [res.data, ...prev]);
      setCommentText('');
      if (post) {
        setPost({ ...post, commentCount: (post.commentCount || 0) + 1 });
      }
    } catch {} finally {
      setSubmitting(false);
    }
  };

  const handleReply = async () => {
    if (!replyText.trim() || submitting || !replyTo) return;
    setSubmitting(true);
    try {
      const res = await createReply(replyTo.ID, replyText.trim(), replyTo.userId);
      setComments((prev) =>
        prev.map((c) =>
          c.ID === replyTo.ID
            ? { ...c, replies: [...(c.replies || []), res.data], replyCount: (c.replyCount || 0) + 1 }
            : c
        )
      );
      setReplyText('');
      setReplyTo(null);
    } catch {} finally {
      setSubmitting(false);
    }
  };

  const handleDeleteComment = async (commentId) => {
    try {
      await delComment(commentId);
      setComments((prev) => prev.filter((c) => c.ID !== commentId));
    } catch {}
  };

  if (loading) return <p style={styles.loading}>Loading...</p>;
  if (!post) return null;

  return (
    <div>
      <header style={styles.header}>
        <button onClick={() => navigate(-1)} style={styles.backBtn}>
          <svg width="20" height="20" viewBox="0 0 24 24" fill="#0f1419">
            <path d="M7.414 13l5.043 5.04-1.414 1.42L3.586 12l7.457-7.46 1.414 1.42L7.414 11H21v2H7.414z" />
          </svg>
        </button>
        <h2 style={styles.title}>{t('post.title')}</h2>
      </header>

      <TweetCard post={post} />

      {isAuthenticated && (
        <div style={styles.composer}>
          <textarea
            value={commentText}
            onChange={(e) => setCommentText(e.target.value)}
            placeholder={t('post.commentPlaceholder')}
            maxLength={1000}
            rows={2}
            style={styles.textarea}
            disabled={submitting}
          />
          <div style={styles.composerBottom}>
            <span style={styles.count}>{commentText.length}/1000</span>
            <button
              onClick={handleComment}
              disabled={!commentText.trim() || submitting}
              style={{
                ...styles.submitBtn,
                opacity: commentText.trim() && !submitting ? 1 : 0.4,
              }}
            >
              {t('post.comment')}
            </button>
          </div>
        </div>
      )}

      <div style={styles.sectionHeader}>
        <h3 style={styles.sectionTitle}>{t('post.replies')}</h3>
      </div>

      {comments.length === 0 && (
        <p style={styles.empty}>{t('home.empty')}</p>
      )}

      {comments.map((comment) => (
        <div key={comment.ID} style={styles.commentItem}>
          <img
            src={comment.user?.avatar || `https://api.dicebear.com/9.x/thumbs/svg?seed=${comment.user?.username || comment.userId}`}
            alt=""
            style={styles.commentAvatar}
          />
          <div style={styles.commentBody}>
            <div style={styles.commentHeader}>
              <span style={styles.commentName}>{comment.user?.nickname || 'User'}</span>
              <span style={styles.commentHandle}>@{comment.user?.username || '...'}</span>
              <span style={styles.dot}>·</span>
              <span style={styles.commentTime}>{relativeTime(comment.createdAt)}</span>
            </div>
            <p style={styles.commentContent}>{comment.content}</p>
            <div style={styles.commentActions}>
              <button
                style={styles.replyBtn}
                onClick={() => setReplyTo(replyTo?.ID === comment.ID ? null : comment)}
              >
                {t('post.reply')}
              </button>
              {comment.userId === user?.ID && (
                <button
                  style={styles.deleteBtn}
                  onClick={() => handleDeleteComment(comment.ID)}
                >
                  Delete
                </button>
              )}
            </div>

            {(comment.replies || []).length > 0 && (
              <div style={styles.replies}>
                {(comment.replies || []).map((reply) => (
                  <div key={reply.ID} style={styles.replyItem}>
                    <span style={styles.replyName}>{reply.user?.nickname || 'User'}</span>
                    {reply.atUser && <span style={styles.replyAt}> @{reply.atUser.username} </span>}
                    <span style={styles.replyContent}>{reply.content}</span>
                  </div>
                ))}
              </div>
            )}

            {replyTo?.ID === comment.ID && (
              <div style={styles.replyComposer}>
                <input
                  value={replyText}
                  onChange={(e) => setReplyText(e.target.value)}
                  placeholder={t('post.replyPlaceholder')}
                  style={styles.replyInput}
                  onKeyDown={(e) => {
                    if (e.key === 'Enter') handleReply();
                  }}
                />
              </div>
            )}
          </div>
        </div>
      ))}
    </div>
  );
}

const styles = {
  header: {
    display: 'flex',
    alignItems: 'center',
    gap: 16,
    padding: '12px 16px',
    borderBottom: '1px solid #eff3f4',
    position: 'sticky',
    top: 0,
    background: 'rgba(255,255,255,0.85)',
    backdropFilter: 'blur(12px)',
    zIndex: 10,
  },
  backBtn: {
    background: 'transparent',
    border: 'none',
    cursor: 'pointer',
    padding: 4,
    borderRadius: '50%',
  },
  title: {
    fontSize: 20,
    fontWeight: 800,
    color: '#0f1419',
  },
  composer: {
    padding: '12px 16px',
    borderBottom: '1px solid #eff3f4',
  },
  textarea: {
    width: '100%',
    fontSize: 15,
    lineHeight: 1.5,
    color: '#0f1419',
    background: 'transparent',
    padding: '8px 0',
    border: 'none',
    outline: 'none',
    resize: 'none',
  },
  composerBottom: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  count: {
    fontSize: 13,
    color: '#536471',
  },
  submitBtn: {
    background: '#e91e63',
    color: '#ffffff',
    fontWeight: 700,
    fontSize: 14,
    padding: '8px 20px',
    borderRadius: 9999,
    border: 'none',
    cursor: 'pointer',
  },
  sectionHeader: {
    padding: '12px 16px',
    borderBottom: '1px solid #eff3f4',
  },
  sectionTitle: {
    fontSize: 16,
    fontWeight: 800,
    color: '#0f1419',
  },
  empty: {
    textAlign: 'center',
    color: '#536471',
    padding: '32px 16px',
    fontSize: 15,
  },
  loading: {
    textAlign: 'center',
    color: '#536471',
    padding: '32px 16px',
  },
  commentItem: {
    display: 'flex',
    gap: 12,
    padding: '12px 16px',
    borderBottom: '1px solid #eff3f4',
  },
  commentAvatar: {
    width: 36,
    height: 36,
    borderRadius: '50%',
    flexShrink: 0,
    background: '#f7f9f9',
  },
  commentBody: {
    flex: 1,
    minWidth: 0,
  },
  commentHeader: {
    display: 'flex',
    alignItems: 'center',
    gap: 4,
    marginBottom: 2,
    fontSize: 13,
  },
  commentName: {
    fontWeight: 700,
    color: '#0f1419',
  },
  commentHandle: {
    color: '#536471',
  },
  dot: {
    color: '#536471',
  },
  commentTime: {
    color: '#536471',
  },
  commentContent: {
    fontSize: 15,
    lineHeight: 1.4,
    color: '#0f1419',
    marginBottom: 6,
    wordBreak: 'break-word',
  },
  commentActions: {
    display: 'flex',
    gap: 16,
  },
  replyBtn: {
    background: 'transparent',
    border: 'none',
    color: '#536471',
    fontSize: 13,
    cursor: 'pointer',
    padding: 2,
  },
  deleteBtn: {
    background: 'transparent',
    border: 'none',
    color: '#e91e63',
    fontSize: 13,
    cursor: 'pointer',
    padding: 2,
  },
  replies: {
    marginTop: 8,
    paddingLeft: 8,
    borderLeft: '2px solid #eff3f4',
  },
  replyItem: {
    padding: '4px 0',
    fontSize: 14,
    lineHeight: 1.4,
  },
  replyName: {
    fontWeight: 700,
    color: '#0f1419',
  },
  replyAt: {
    color: '#e91e63',
  },
  replyContent: {
    color: '#0f1419',
  },
  replyComposer: {
    marginTop: 8,
  },
  replyInput: {
    width: '100%',
    padding: '8px 12px',
    fontSize: 14,
    border: '1px solid #cfd9de',
    borderRadius: 9999,
    outline: 'none',
  },
};
