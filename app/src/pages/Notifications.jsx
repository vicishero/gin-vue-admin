import { useState, useEffect, useCallback } from 'react';
import { useTranslation } from 'react-i18next';
import { getNotifications, markNotificationsRead, getUnreadCount, relativeTime } from '../utils/api';

const TYPE_ICONS = {
  1: LikeIcon,
  2: CommentIcon,
  3: ReplyIcon,
  4: FollowIcon,
  5: SystemIcon,
};

const TYPE_MSG_KEY = {
  1: 'notifications.likedYourChirp',
  2: 'notifications.repliedYourChirp',
  3: 'notifications.repliedYourChirp',
  4: 'notifications.followedYou',
};

export default function Notifications() {
  const { t } = useTranslation();
  const [notifs, setNotifs] = useState([]);
  const [unread, setUnread] = useState(0);
  const [loading, setLoading] = useState(true);

  const load = useCallback(async () => {
    setLoading(true);
    try {
      const [res, countRes] = await Promise.all([
        getNotifications({ page: 1, pageSize: 50 }),
        getUnreadCount().catch(() => ({ data: { count: 0 } })),
      ]);
      setNotifs(res.data.list || []);
      setUnread(countRes.data.count || 0);
    } catch {} finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => { load(); }, [load]);

  const markAllRead = async () => {
    const unreadIds = notifs.filter((n) => !n.isRead).map((n) => n.ID);
    if (unreadIds.length === 0) return;
    try {
      await markNotificationsRead(unreadIds);
      setNotifs((prev) => prev.map((n) => ({ ...n, isRead: true })));
      setUnread(0);
    } catch {}
  };

  return (
    <div>
      <header style={styles.header}>
        <div style={styles.headerRow}>
          <h2 style={styles.title}>{t('notifications.title')}</h2>
          {unread > 0 && (
            <button onClick={markAllRead} style={styles.markReadBtn}>
              Mark all read
            </button>
          )}
        </div>
      </header>

      {loading && <p style={styles.loading}>Loading...</p>}

      {!loading && notifs.length === 0 && (
        <p style={styles.empty}>No notifications yet</p>
      )}

      {notifs.map((n) => {
        const IconComponent = TYPE_ICONS[n.type] || SystemIcon;
        const msgKey = TYPE_MSG_KEY[n.type];
        return (
          <div
            key={n.ID}
            style={{
              ...styles.item,
              background: n.isRead ? '#ffffff' : '#fff0f5',
            }}
          >
            <div style={styles.iconWrap}>
              <IconComponent />
            </div>
            <div style={styles.content}>
              <p style={styles.text}>
                {msgKey ? t(msgKey) : n.brief}
              </p>
              <p style={styles.time}>{relativeTime(n.createdAt)}</p>
            </div>
          </div>
        );
      })}
    </div>
  );
}

function LikeIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="#e91e63">
      <path d="M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.351 4.647 2.529.816-1.178 2.357-2.529 4.647-2.529 2.878 0 5.403 2.69 5.403 5.754 0 6.378-7.453 13.112-10.063 13.16H12z" />
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

function ReplyIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="#e91e63">
      <path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366a8.13 8.13 0 0 1 8.129 8.13c0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067A8.005 8.005 0 0 1 1.751 10zM8.005 3.5a6.5 6.5 0 0 0 0 13h1.567v2.51L17.2 14.84a6.63 6.63 0 0 0 3.046-5.66A6.63 6.63 0 0 0 14.122 3.5H8.005z" />
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

function SystemIcon() {
  return (
    <svg width="20" height="20" viewBox="0 0 24 24" fill="#e91e63">
      <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z" />
    </svg>
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
  headerRow: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  title: {
    fontSize: 20,
    fontWeight: 800,
    color: '#0f1419',
  },
  markReadBtn: {
    fontSize: 13,
    color: '#e91e63',
    background: 'transparent',
    border: 'none',
    fontWeight: 600,
    cursor: 'pointer',
  },
  loading: {
    textAlign: 'center',
    color: '#536471',
    padding: '32px 16px',
  },
  empty: {
    textAlign: 'center',
    color: '#536471',
    padding: '32px 16px',
    fontSize: 15,
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
