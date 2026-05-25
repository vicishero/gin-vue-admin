import React, { useState } from 'react';
import { useTranslation } from 'react-i18next';

export default function TweetComposer({ onTweet, currentUser }) {
  const { t } = useTranslation();
  const [text, setText] = useState('');

  const handleSubmit = () => {
    if (!text.trim()) return;
    onTweet(text.trim());
    setText('');
  };

  return (
    <div style={styles.wrapper}>
      <img src={currentUser.avatar} alt="" style={styles.avatar} />
      <div style={styles.inputArea}>
        <textarea
          value={text}
          onChange={(e) => setText(e.target.value)}
          placeholder={t('home.placeholder')}
          maxLength={280}
          rows={3}
          style={styles.textarea}
        />
        <div style={styles.bottom}>
          <span style={styles.count}>{text.length}/280</span>
          <button
            onClick={handleSubmit}
            disabled={!text.trim()}
            style={{
              ...styles.btn,
              opacity: text.trim() ? 1 : 0.4,
            }}
          >
            {t('home.chirp')}
          </button>
        </div>
      </div>
    </div>
  );
}

const styles = {
  wrapper: {
    display: 'flex',
    gap: 12,
    padding: '16px',
    borderBottom: '1px solid #eff3f4',
  },
  avatar: {
    width: 44,
    height: 44,
    borderRadius: '50%',
    flexShrink: 0,
    background: '#f7f9f9',
  },
  inputArea: {
    flex: 1,
    minWidth: 0,
  },
  textarea: {
    width: '100%',
    fontSize: 18,
    lineHeight: 1.5,
    color: '#0f1419',
    background: 'transparent',
    padding: '8px 0',
  },
  bottom: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 8,
  },
  count: {
    fontSize: 13,
    color: '#536471',
  },
  btn: {
    background: '#e91e63',
    color: '#ffffff',
    fontWeight: 700,
    fontSize: 15,
    padding: '10px 24px',
    borderRadius: 9999,
    transition: 'opacity 0.15s',
  },
};
