import React, { useState } from 'react';
import { useTranslation } from 'react-i18next';
import TweetCard, { MOCK_TWEETS, AVATARS } from '../components/TweetCard';
import TweetComposer from '../components/TweetComposer';

const CURRENT_USER = {
  name: 'You',
  handle: '@you',
  avatar: AVATARS[0],
};

export default function Home() {
  const { t } = useTranslation();
  const [tweets, setTweets] = useState(MOCK_TWEETS);

  const handleNewTweet = (content) => {
    const newTweet = {
      id: Date.now(),
      name: CURRENT_USER.name,
      handle: CURRENT_USER.handle,
      avatar: CURRENT_USER.avatar,
      time: 'now',
      content,
      likes: 0,
      retweets: 0,
      comments: 0,
      liked: false,
    };
    setTweets((prev) => [newTweet, ...prev]);
  };

  const handleLike = (id) => {
    setTweets((prev) =>
      prev.map((t) =>
        t.id === id ? { ...t, liked: !t.liked, likes: t.liked ? t.likes - 1 : t.likes + 1 } : t
      )
    );
  };

  const handleRetweet = (id) => {
    setTweets((prev) =>
      prev.map((t) =>
        t.id === id ? { ...t, retweeted: !t.retweeted, retweets: t.retweeted ? t.retweets - 1 : t.retweets + 1 } : t
      )
    );
  };

  return (
    <div>
      <header style={styles.header}>
        <h2 style={styles.title}>{t('home.title')}</h2>
      </header>
      <TweetComposer onTweet={handleNewTweet} currentUser={CURRENT_USER} />
      {tweets.map((tweet) => (
        <TweetCard
          key={tweet.id}
          tweet={tweet}
          onLike={handleLike}
          onRetweet={handleRetweet}
        />
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
};
