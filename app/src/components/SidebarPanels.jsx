export function CommunityPanel() {
  return (
    <div style={styles.panel}>
      <div style={styles.panelHeader}>
        <h3 style={styles.panelTitle}>社群動態</h3>
        <span style={styles.panelSubtitle}>COMMUNITY ACTIVITY</span>
      </div>

      <div style={styles.activityItem}>
        <div style={styles.activityLeft}>
          <span style={styles.activityLabel}>今日新增粉絲</span>
          <span style={styles.activityValue}>+8.2K</span>
        </div>
        <div style={styles.activityIcon}>
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path d="M12 4.5C14.76 4.5 17 6.74 17 9.5C17 12.26 14.76 14.5 12 14.5C9.24 14.5 7 12.26 7 9.5C7 6.74 9.24 4.5 12 4.5ZM12 2C7.03 2 3 6.03 3 11C3 15.97 7.03 20 12 20C16.97 20 21 15.97 21 11C21 6.03 16.97 2 12 2ZM12 18C9.1 18 6.58 16.84 5 15.03C5.03 12.44 6.3 10.14 8.33 8.63C9.5 7.97 10.75 7.6 12 7.6C13.25 7.6 14.5 7.97 15.67 8.63C17.7 10.14 18.97 12.44 19 15.03C17.42 16.84 14.9 18 12 18Z" fill="url(#activityGrad)" />
            <defs>
              <linearGradient id="activityGrad" x1="3" y1="12" x2="21" y2="12" gradientUnits="userSpaceOnUse">
                <stop stopColor="#667EEA" />
                <stop offset="1" stopColor="#764BA2" />
              </linearGradient>
            </defs>
          </svg>
        </div>
      </div>

      <div style={styles.activityItem}>
        <div style={styles.activityLeft}>
          <span style={styles.activityLabel}>互動數</span>
          <span style={styles.activityValue}>+23.5K</span>
        </div>
        <div style={styles.activityIcon}>
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path d="M12 21.638h-.014C9.403 21.59 1.95 14.856 1.95 8.478c0-3.064 2.525-5.754 5.403-5.754 2.29 0 3.83 1.351 4.647 2.529.816-1.178 2.357-2.529 4.647-2.529 2.878 0 5.403 2.69 5.403 5.754 0 6.378-7.453 13.112-10.063 13.16H12z" fill="url(#heartGrad)" />
            <defs>
              <linearGradient id="heartGrad" x1="1.95" y1="12" x2="22.05" y2="12" gradientUnits="userSpaceOnUse">
                <stop stopColor="#E91E63" />
                <stop offset="1" stopColor="#FF6B9D" />
              </linearGradient>
            </defs>
          </svg>
        </div>
      </div>

      <div style={styles.activityItem}>
        <div style={styles.activityLeft}>
          <span style={styles.activityLabel}>新內容發布</span>
          <span style={styles.activityValue}>+128</span>
        </div>
        <div style={styles.activityIcon}>
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
            <path d="M12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM12 20C7.59 20 4 16.41 4 12C4 7.59 7.59 4 12 4C16.41 4 20 7.59 20 12C20 16.41 16.41 20 12 20ZM11 7H13V13H11V7ZM11 15H13V17H11V15Z" fill="url(#contentGrad)" />
            <defs>
              <linearGradient id="contentGrad" x1="2" y1="12" x2="22" y2="12" gradientUnits="userSpaceOnUse">
                <stop stopColor="#667EEA" />
                <stop offset="1" stopColor="#764BA2" />
              </linearGradient>
            </defs>
          </svg>
        </div>
      </div>
    </div>
  );
}

export function AICompanionPanel() {
  return (
    <div style={styles.panel}>
      <div style={styles.panelHeader}>
        <h3 style={styles.panelTitle}>AI COMPANION</h3>
        <div style={styles.onlineIndicator}>
          <span style={styles.onlineDot}></span>
          <span style={styles.onlineText}>在線</span>
        </div>
      </div>

      <div style={styles.companionProfile}>
        <div style={styles.companionAvatar}>
          <img
            src="https://api.dicebear.com/9.x/thumbs/svg?seed=miri&backgroundColor=ffdfbf"
            alt="Miri"
            style={{ width: '100%', height: '100%', borderRadius: '50%' }}
          />
          {true && (
            <div style={styles.liveIndicator}>
              <span style={styles.livePulse}></span>
            </div>
          )}
        </div>
        <div style={styles.companionInfo}>
          <div style={styles.companionNameRow}>
            <span style={styles.companionName}>蜜梨 Miri</span>
            <span style={styles.companionLiveBadge}>LIVE</span>
          </div>
          <span style={styles.companionDesc}>我們的回憶已經持續了 128 天</span>
        </div>
      </div>

      <div style={styles.todaySection}>
        <h4 style={styles.todayTitle}>今日陪伴</h4>
        <span style={styles.todaySubtitle}>TODAY WITH MIRI</span>
      </div>

      <div style={styles.messageList}>
        <div style={styles.messageItem}>
          <div style={styles.messageAvatar}>
            <img
              src="https://api.dicebear.com/9.x/thumbs/svg?seed=miri&backgroundColor=ffdfbf"
              alt=""
              style={{ width: '100%', height: '100%', borderRadius: '50%' }}
            />
          </div>
          <div style={styles.messageContent}>
            <span style={styles.messageText}>早安！今天想和我聊些什麼呢？🥰</span>
            <span style={styles.messageTime}>09:30</span>
          </div>
        </div>

        <div style={styles.messageItem}>
          <div style={styles.messageAvatar}>
            <img
              src="https://api.dicebear.com/9.x/thumbs/svg?seed=miri&backgroundColor=ffdfbf"
              alt=""
              style={{ width: '100%', height: '100%', borderRadius: '50%' }}
            />
          </div>
          <div style={styles.messageContent}>
            <div style={styles.audioMessage}>
              <div style={styles.audioWave}>
                {[...Array(5)].map((_, i) => (
                  <span key={i} style={{
                    ...styles.waveBar,
                    height: `${8 + i * 4}px`,
                    animationDelay: `${i * 0.1}s`,
                  }}></span>
                ))}
              </div>
              <span style={styles.audioTime}>15"</span>
            </div>
            <span style={styles.messageTime}>09:32</span>
          </div>
        </div>

        <div style={styles.messageItemRight}>
          <div style={styles.messageContentRight}>
            <span style={styles.messageTextRight}>我想聽你唱歌～</span>
            <span style={styles.messageTime}>09:35</span>
          </div>
        </div>

        <div style={styles.messageItem}>
          <div style={styles.messageAvatar}>
            <img
              src="https://api.dicebear.com/9.x/thumbs/svg?seed=miri&backgroundColor=ffdfbf"
              alt=""
              style={{ width: '100%', height: '100%', borderRadius: '50%' }}
            />
          </div>
          <div style={styles.messageContent}>
            <span style={styles.messageText}>好的～這首歌送給你</span>
            <div style={styles.musicCard}>
              <div style={styles.musicCover}></div>
              <div style={styles.musicInfo}>
                <span style={styles.musicTitle}>Morning Melodies</span>
                <span style={styles.musicIcon}>🎵</span>
              </div>
            </div>
            <span style={styles.messageTime}>09:38</span>
          </div>
        </div>
      </div>
    </div>
  );
}

export function VIPPanel() {
  return (
    <div style={styles.vipPanel}>
      <div style={styles.vipGradient}>
        <div style={styles.vipContent}>
          <div style={styles.vipIcon}>
            <svg width="32" height="32" viewBox="0 0 24 24" fill="none">
              <path d="M12 2L22 12L12 22L2 12L12 2Z" fill="url(#vipGrad)" />
              <path d="M12 6L16 10L12 14L8 10L12 6Z" fill="white" />
              <defs>
                <linearGradient id="vipGrad" x1="2" y1="12" x2="22" y2="12" gradientUnits="userSpaceOnUse">
                  <stop stopColor="#667EEA" />
                  <stop offset="1" stopColor="#764BA2" />
                </linearGradient>
              </defs>
            </svg>
          </div>
          <div style={styles.vipText}>
            <h3 style={styles.vipTitle}>MIRIVERSE VIP</h3>
            <p style={styles.vipDesc}>解鎖專屬內容與功能</p>
          </div>
        </div>
        <div style={styles.vipFeatures}>
          <span style={styles.vipFeature}>✓ 專屬語音互動</span>
          <span style={styles.vipFeature}>✓ 優先活動參與</span>
          <span style={styles.vipFeature}>✓ 限定內容觀看</span>
          <span style={styles.vipFeature}>✓ 專屬徽章展示</span>
        </div>
        <button style={styles.vipButton}>立即升級</button>
      </div>
    </div>
  );
}

export function CreatorList() {
  const creators = [
    { name: '蜜梨 Miri', fans: '92.5K', isLive: true },
    { name: '小夜 Yoru', fans: '89.1K', isLive: false },
    { name: '星見凜 Rin', fans: '91.2K', isLive: false },
    { name: '千羽 Sen', fans: '87.7K', isLive: false },
  ];

  return (
    <div style={styles.panel}>
      <div style={styles.panelHeader}>
        <h3 style={styles.panelTitle}>人氣創作者</h3>
        <span style={styles.panelSubtitle}>TOP CREATORS</span>
      </div>
      <div style={styles.creatorList}>
        {creators.map((creator, idx) => (
          <div key={idx} style={styles.creatorItem}>
            <div style={styles.creatorAvatar}>
              <img
                src={`https://api.dicebear.com/9.x/thumbs/svg?seed=${creator.name}&backgroundColor=${idx % 2 === 0 ? 'ffdfbf' : 'c0aede'}`}
                alt={creator.name}
                style={{ width: '100%', height: '100%', borderRadius: '50%' }}
              />
              {creator.isLive && (
                <div style={styles.creatorLiveBadge}>
                  <span style={styles.creatorLiveDot}></span>
                  LIVE
                </div>
              )}
            </div>
            <div style={styles.creatorInfo}>
              <span style={styles.creatorName}>{creator.name}</span>
              <span style={styles.creatorFans}>♡ {creator.fans}</span>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}

const styles = {
  panel: {
    background: '#ffffff',
    borderRadius: 20,
    padding: 20,
    boxShadow: '0 4px 20px rgba(102, 126, 234, 0.08)',
  },
  panelHeader: {
    marginBottom: 16,
  },
  panelTitle: {
    fontSize: 16,
    fontWeight: 700,
    color: '#1a1a2e',
    marginBottom: 4,
  },
  panelSubtitle: {
    fontSize: 11,
    color: '#8b95a5',
    fontWeight: 600,
    letterSpacing: 0.5,
  },
  onlineIndicator: {
    display: 'flex',
    alignItems: 'center',
    gap: 6,
  },
  onlineDot: {
    width: 8,
    height: 8,
    borderRadius: '50%',
    background: '#4ade80',
  },
  onlineText: {
    fontSize: 12,
    color: '#4ade80',
    fontWeight: 600,
  },
  activityItem: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    padding: '16px 0',
    borderBottom: '1px solid #f0f2f8',
  },
  activityLeft: {
    display: 'flex',
    flexDirection: 'column',
    gap: 4,
  },
  activityLabel: {
    fontSize: 13,
    color: '#536471',
  },
  activityValue: {
    fontSize: 18,
    fontWeight: 700,
    color: '#764ba2',
  },
  activityIcon: {
    width: 44,
    height: 44,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  companionProfile: {
    display: 'flex',
    gap: 12,
    alignItems: 'center',
    paddingBottom: 16,
    borderBottom: '1px solid #f0f2f8',
  },
  companionAvatar: {
    width: 72,
    height: 72,
    borderRadius: '50%',
    position: 'relative',
    flexShrink: 0,
  },
  liveIndicator: {
    position: 'absolute',
    bottom: 4,
    right: 4,
    width: 20,
    height: 20,
    borderRadius: '50%',
    background: '#ffffff',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  livePulse: {
    width: 12,
    height: 12,
    borderRadius: '50%',
    background: '#e91e63',
    animation: 'pulse 2s infinite',
  },
  companionInfo: {
    flex: 1,
    minWidth: 0,
  },
  companionNameRow: {
    display: 'flex',
    alignItems: 'center',
    gap: 8,
    marginBottom: 4,
  },
  companionName: {
    fontSize: 16,
    fontWeight: 700,
    color: '#1a1a2e',
  },
  companionLiveBadge: {
    background: 'linear-gradient(135deg, #e91e63 0%, #ff6b9d 100%)',
    color: '#ffffff',
    fontSize: 10,
    fontWeight: 700,
    padding: '2px 8px',
    borderRadius: 9999,
  },
  companionDesc: {
    fontSize: 13,
    color: '#536471',
    lineHeight: 1.5,
  },
  todaySection: {
    padding: '16px 0 12px',
  },
  todayTitle: {
    fontSize: 14,
    fontWeight: 700,
    color: '#1a1a2e',
    marginBottom: 2,
  },
  todaySubtitle: {
    fontSize: 10,
    color: '#8b95a5',
    fontWeight: 600,
    letterSpacing: 0.5,
  },
  messageList: {
    display: 'flex',
    flexDirection: 'column',
    gap: 12,
  },
  messageItem: {
    display: 'flex',
    gap: 10,
    alignItems: 'flex-start',
  },
  messageItemRight: {
    display: 'flex',
    justifyContent: 'flex-end',
  },
  messageAvatar: {
    width: 32,
    height: 32,
    borderRadius: '50%',
    flexShrink: 0,
  },
  messageContent: {
    flex: 1,
    minWidth: 0,
  },
  messageContentRight: {
    maxWidth: '70%',
  },
  messageText: {
    display: 'inline-block',
    background: '#f8f9ff',
    padding: '10px 14px',
    borderRadius: '16px 16px 16px 4px',
    fontSize: 13,
    color: '#1a1a2e',
    lineHeight: 1.5,
    marginBottom: 4,
  },
  messageTextRight: {
    display: 'inline-block',
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
    color: '#ffffff',
    padding: '10px 14px',
    borderRadius: '16px 16px 4px 16px',
    fontSize: 13,
    lineHeight: 1.5,
    marginBottom: 4,
  },
  messageTime: {
    fontSize: 11,
    color: '#8b95a5',
  },
  audioMessage: {
    display: 'flex',
    alignItems: 'center',
    gap: 10,
    background: '#f8f9ff',
    padding: '12px 16px',
    borderRadius: '16px 16px 16px 4px',
    marginBottom: 4,
  },
  audioWave: {
    display: 'flex',
    gap: 3,
    alignItems: 'flex-end',
  },
  waveBar: {
    width: 3,
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
    borderRadius: 2,
    animation: 'wave 1s infinite ease-in-out',
  },
  audioTime: {
    fontSize: 12,
    color: '#8b95a5',
    fontWeight: 500,
  },
  musicCard: {
    display: 'flex',
    alignItems: 'center',
    gap: 10,
    background: '#f8f9ff',
    padding: 12,
    borderRadius: 12,
    marginTop: 8,
  },
  musicCover: {
    width: 44,
    height: 44,
    borderRadius: 8,
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
  },
  musicInfo: {
    flex: 1,
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  musicTitle: {
    fontSize: 13,
    fontWeight: 600,
    color: '#1a1a2e',
  },
  musicIcon: {
    fontSize: 16,
  },
  vipPanel: {
    borderRadius: 20,
    overflow: 'hidden',
    boxShadow: '0 4px 20px rgba(102, 126, 234, 0.12)',
  },
  vipGradient: {
    background: 'linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.15) 100%)',
    padding: 20,
  },
  vipContent: {
    display: 'flex',
    alignItems: 'center',
    gap: 12,
    marginBottom: 16,
  },
  vipIcon: {
    width: 48,
    height: 48,
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  vipText: {},
  vipTitle: {
    fontSize: 16,
    fontWeight: 800,
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 50%, #e91e63 100%)',
    WebkitBackgroundClip: 'text',
    WebkitTextFillColor: 'transparent',
    backgroundClip: 'text',
    marginBottom: 4,
  },
  vipDesc: {
    fontSize: 13,
    color: '#536471',
  },
  vipFeatures: {
    display: 'flex',
    flexWrap: 'wrap',
    gap: '8px 16px',
    marginBottom: 16,
  },
  vipFeature: {
    fontSize: 12,
    color: '#536471',
  },
  vipButton: {
    width: '100%',
    padding: '12px 24px',
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
    color: '#ffffff',
    fontSize: 14,
    fontWeight: 700,
    borderRadius: 9999,
    border: 'none',
    cursor: 'pointer',
  },
  creatorList: {
    display: 'flex',
    flexDirection: 'column',
    gap: 12,
  },
  creatorItem: {
    display: 'flex',
    alignItems: 'center',
    gap: 12,
    padding: '8px 0',
  },
  creatorAvatar: {
    width: 52,
    height: 52,
    borderRadius: '50%',
    position: 'relative',
    flexShrink: 0,
  },
  creatorLiveBadge: {
    position: 'absolute',
    bottom: 0,
    right: 0,
    background: 'linear-gradient(135deg, #e91e63 0%, #ff6b9d 100%)',
    color: '#ffffff',
    fontSize: 9,
    fontWeight: 700,
    padding: '2px 8px',
    borderRadius: 9999,
    display: 'flex',
    alignItems: 'center',
    gap: 4,
  },
  creatorLiveDot: {
    width: 6,
    height: 6,
    borderRadius: '50%',
    background: '#ffffff',
  },
  creatorInfo: {
    display: 'flex',
    flexDirection: 'column',
    gap: 2,
  },
  creatorName: {
    fontSize: 14,
    fontWeight: 700,
    color: '#1a1a2e',
  },
  creatorFans: {
    fontSize: 12,
    color: '#764ba2',
    fontWeight: 500,
  },
};
