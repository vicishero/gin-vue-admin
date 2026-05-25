import React from 'react';

const AVATARS = [
  'https://api.dicebear.com/9.x/thumbs/svg?seed=Felix',
  'https://api.dicebear.com/9.x/thumbs/svg?seed=Aneka',
  'https://api.dicebear.com/9.x/thumbs/svg?seed=Salem',
  'https://api.dicebear.com/9.x/thumbs/svg?seed=Midnight',
  'https://api.dicebear.com/9.x/thumbs/svg?seed=Snowy',
  'https://api.dicebear.com/9.x/thumbs/svg?seed=Cleo',
];

const MOCK_TWEETS = [
  {
    id: 1,
    name: 'Felix',
    handle: '@felix',
    avatar: AVATARS[0],
    time: '2h',
    content: 'Just shipped a new feature! The users are loving it so far. Big thanks to the team for pulling this together.',
    likes: 142,
    retweets: 28,
    comments: 12,
    liked: true,
  },
  {
    id: 2,
    name: 'Aneka',
    handle: '@aneka_design',
    avatar: AVATARS[1],
    time: '4h',
    content: 'Design tip: less is more. White space is not wasted space — it gives your content room to breathe. 🎨',
    likes: 389,
    retweets: 102,
    comments: 37,
    liked: false,
  },
  {
    id: 3,
    name: 'Salem Codes',
    handle: '@salemcodes',
    avatar: AVATARS[2],
    time: '6h',
    content: 'React Server Components are a game changer. Smaller bundles, faster loads, better UX. If you haven\'t tried them yet, this weekend is the time.',
    likes: 256,
    retweets: 64,
    comments: 43,
    liked: true,
  },
  {
    id: 4,
    name: 'Midnight Dev',
    handle: '@midnightdev',
    avatar: AVATARS[3],
    time: '8h',
    content: 'Hot take: Tailwind CSS is the best thing that happened to frontend development in the last decade. Fight me.',
    likes: 512,
    retweets: 178,
    comments: 89,
    liked: false,
  },
  {
    id: 5,
    name: 'Snowy Tech',
    handle: '@snowytech',
    avatar: AVATARS[4],
    time: '10h',
    content: 'Building a new app from scratch using Vite + React. The developer experience is incredible. Zero config, instant HMR, and the build is blazing fast.',
    likes: 198,
    retweets: 41,
    comments: 15,
    liked: false,
  },
  {
    id: 6,
    name: 'Cleo Bytes',
    handle: '@cleobytes',
    avatar: AVATARS[5],
    time: '12h',
    content: 'Remember: code is read far more than it is written. Write for readability first, optimization second. Your future self will thank you.',
    likes: 634,
    retweets: 231,
    comments: 56,
    liked: true,
  },
];

export default function TweetCard({ tweet, onLike, onRetweet }) {
  return (
    <article style={styles.card}>
      <img src={tweet.avatar} alt={tweet.name} style={styles.avatar} />
      <div style={styles.body}>
        <div style={styles.header}>
          <span style={styles.name}>{tweet.name}</span>
          <span style={styles.handle}>{tweet.handle}</span>
          <span style={styles.dot}>·</span>
          <span style={styles.time}>{tweet.time}</span>
        </div>
        <p style={styles.content}>{tweet.content}</p>
        <div style={styles.actions}>
          <button style={styles.actionBtn} title="Comment">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="#536471">
              <path d="M1.751 10c0-4.42 3.584-8 8.005-8h4.366a8.13 8.13 0 0 1 8.129 8.13c0 2.96-1.607 5.68-4.196 7.11l-8.054 4.46v-3.69h-.067A8.005 8.005 0 0 1 1.751 10zM8.005 3.5a6.5 6.5 0 0 0 0 13h1.567v2.51L17.2 14.84a6.63 6.63 0 0 0 3.046-5.66A6.63 6.63 0 0 0 14.122 3.5H8.005z" />
            </svg>
            <span style={styles.actionCount}>{tweet.comments}</span>
          </button>
          <button style={styles.actionBtn} onClick={() => onRetweet(tweet.id)} title="Retweet">
            <svg width="18" height="18" viewBox="0 0 24 24" fill={tweet.retweeted ? '#e91e63' : '#536471'}>
              <path d="M4.75 3.79l4.603 4.3-1.706 1.82L6 8.38v7.37c0 .97.784 1.75 1.75 1.75H13v2H7.75c-2.072 0-3.75-1.68-3.75-3.75V8.38l-1.647 1.53-1.706-1.82L4.75 3.79zM19.25 20.21l-4.603-4.3 1.706-1.82L18 15.62V8.25c0-.97-.784-1.75-1.75-1.75H11v-2h5.25c2.072 0 3.75 1.68 3.75 3.75v7.37l1.647-1.53 1.706 1.82-4.603 4.3z" />
            </svg>
            <span style={styles.actionCount}>{tweet.retweets}</span>
          </button>
          <button
            style={{ ...styles.actionBtn, color: tweet.liked ? '#e91e63' : '#536471' }}
            onClick={() => onLike(tweet.id)}
            title="Like"
          >
            <svg width="18" height="18" viewBox="0 0 24 24" fill={tweet.liked ? '#e91e63' : 'none'} stroke={tweet.liked ? '#e91e63' : 'currentColor'} strokeWidth="2">
              <path d="M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.351 4.647 2.529.816-1.178 2.357-2.529 4.647-2.529 2.878 0 5.403 2.69 5.403 5.754 0 6.378-7.453 13.112-10.063 13.16H12z" />
            </svg>
            <span style={styles.actionCount}>{tweet.likes}</span>
          </button>
          <button style={styles.shareBtn} title="Share">
            <svg width="18" height="18" viewBox="0 0 24 24" fill="#536471">
              <path d="M12 2.59l5.7 5.7-1.41 1.42L13 6.41V16h-2V6.41l-3.3 3.3-1.41-1.42L12 2.59zM21 15l-.02 3.51c0 1.38-1.12 2.49-2.5 2.49H5.5C4.11 21 3 19.88 3 18.5V15h2v3.5c0 .28.22.5.5.5h12.98c.28 0 .5-.22.5-.5L19 15h2z" />
            </svg>
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
    padding: '16px',
    borderBottom: '1px solid #eff3f4',
    cursor: 'default',
  },
  avatar: {
    width: 44,
    height: 44,
    borderRadius: '50%',
    flexShrink: 0,
    background: '#f7f9f9',
  },
  body: {
    flex: 1,
    minWidth: 0,
  },
  header: {
    display: 'flex',
    alignItems: 'center',
    gap: 4,
    flexWrap: 'wrap',
    marginBottom: 4,
    fontSize: 14,
  },
  name: {
    fontWeight: 700,
    color: '#0f1419',
  },
  handle: {
    color: '#536471',
  },
  dot: {
    color: '#536471',
  },
  time: {
    color: '#536471',
  },
  content: {
    fontSize: 15,
    lineHeight: 1.5,
    color: '#0f1419',
    marginBottom: 12,
    wordBreak: 'break-word',
  },
  actions: {
    display: 'flex',
    justifyContent: 'space-between',
    maxWidth: 320,
  },
  actionBtn: {
    display: 'flex',
    alignItems: 'center',
    gap: 4,
    padding: 4,
    borderRadius: 9999,
    transition: 'color 0.15s',
    color: '#536471',
  },
  actionCount: {
    fontSize: 13,
  },
  shareBtn: {
    padding: 4,
  },
};

export { MOCK_TWEETS };
export { AVATARS };
