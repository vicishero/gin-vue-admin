import { useState, useRef } from 'react';
import { useTranslation } from 'react-i18next';
import { createPost, uploadImage, API_BASE } from '../utils/api';
import { useAuth } from '../contexts/AuthContext';

const MAX_IMAGES = 4;

export default function TweetComposer({ onTweet }) {
  const { t } = useTranslation();
  const { user } = useAuth();
  const [text, setText] = useState('');
  const [posting, setPosting] = useState(false);
  const [images, setImages] = useState([]); // { url, uploading }
  const fileInputRef = useRef(null);

  const avatar = user?.avatar
    || `https://api.dicebear.com/9.x/thumbs/svg?seed=${user?.username || 'user'}`;

  const handleSelectImages = async (e) => {
    const files = Array.from(e.target.files);
    e.target.value = '';
    const remaining = MAX_IMAGES - images.length;
    if (remaining <= 0) return;
    const toUpload = files.slice(0, remaining);

    // Add placeholders immediately for instant preview
    const placeholders = toUpload.map((file) => ({
      url: URL.createObjectURL(file),
      uploading: true,
    }));
    setImages((prev) => [...prev, ...placeholders]);

    // Upload each image
    for (let i = 0; i < toUpload.length; i++) {
      try {
        const res = await uploadImage(toUpload[i]);
        setImages((prev) =>
          prev.map((img, idx) =>
            idx === images.length + i ? { url: res.data.url, uploading: false } : img
          )
        );
      } catch {
        // Remove failed upload
        setImages((prev) => prev.filter((_, idx) => idx !== images.length + i));
      }
    }
  };

  const removeImage = (idx) => {
    setImages((prev) => prev.filter((_, i) => i !== idx));
  };

  const handleSubmit = async () => {
    if (!text.trim() || posting) return;
    setPosting(true);
    try {
      const contents = [{ type: 2, content: text.trim() }];
      images.forEach((img, i) => {
        if (!img.uploading) {
          contents.push({ type: 3, content: img.url, sort: i + 1 });
        }
      });
      const res = await createPost({ contents, visibility: 90, tags: [] });
      setText('');
      setImages([]);
      if (onTweet) onTweet(res.data);
    } catch {
      // silently fail
    } finally {
      setPosting(false);
    }
  };

  return (
    <div style={styles.wrapper}>
      <img src={avatar} alt="" style={styles.avatar} />
      <div style={styles.inputArea}>
        <textarea
          value={text}
          onChange={(e) => setText(e.target.value)}
          placeholder="分享你的想法..."
          maxLength={2000}
          rows={3}
          style={styles.textarea}
          disabled={posting}
        />
        {images.length > 0 && (
          <div style={styles.imageGrid}>
            {images.map((img, idx) => (
              <div key={idx} style={styles.imageWrap}>
                <img src={img.url.startsWith('blob:') ? img.url : API_BASE + img.url} alt="" style={styles.preview} />
                {img.uploading && <span style={styles.uploadBadge}>...</span>}
                <button style={styles.removeBtn} onClick={() => removeImage(idx)}>✕</button>
              </div>
            ))}
          </div>
        )}
        <div style={styles.bottom}>
          <div style={styles.left}>
            <input
              ref={fileInputRef}
              type="file"
              accept="image/*"
              multiple
              style={{ display: 'none' }}
              onChange={handleSelectImages}
            />
            <button
              style={styles.imageBtn}
              onClick={() => fileInputRef.current?.click()}
              disabled={images.length >= MAX_IMAGES || posting}
              title="Add images"
            >
              <svg width="22" height="22" viewBox="0 0 24 24" fill="currentColor">
                <path d="M19.75 2H4.25A2.25 2.25 0 0 0 2 4.25v15.5A2.25 2.25 0 0 0 4.25 22h15.5A2.25 2.25 0 0 0 22 19.75V4.25A2.25 2.25 0 0 0 19.75 2zM4.25 3.5h15.5a.75.75 0 0 1 .75.75v11.32l-3.35-3.35a.75.75 0 0 0-1.06 0l-8.78 8.78H4.25a.75.75 0 0 1-.75-.75V4.25a.75.75 0 0 1 .75-.75zm15.5 17h-5.86l5.04-5.04 1.57 1.57v2.72a.75.75 0 0 1-.75.75zM8.5 9.25a2.25 2.25 0 1 1 4.5 0 2.25 2.25 0 0 1-4.5 0z" />
              </svg>
            </button>
            <span style={styles.imageHint}>
              {images.length}/{MAX_IMAGES}
            </span>
          </div>
          <span style={styles.count}>{text.length}/2000</span>
          <button
            onClick={handleSubmit}
            disabled={!text.trim() || posting}
            style={{
              ...styles.btn,
              opacity: text.trim() && !posting ? 1 : 0.4,
            }}
          >
            {posting ? '...' : t('home.chirp')}
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
    padding: '16px 20px',
    background: '#ffffff',
  },
  avatar: {
    width: 48,
    height: 48,
    borderRadius: '50%',
    flexShrink: 0,
    background: '#f8f9ff',
  },
  inputArea: {
    flex: 1,
    minWidth: 0,
  },
  textarea: {
    width: '100%',
    fontSize: 16,
    lineHeight: 1.6,
    color: '#1a1a2e',
    background: 'transparent',
    padding: '8px 0',
    border: 'none',
    outline: 'none',
    resize: 'none',
  },
  imageGrid: {
    display: 'flex',
    flexWrap: 'wrap',
    gap: 10,
    marginBottom: 12,
  },
  imageWrap: {
    position: 'relative',
    width: 90,
    height: 90,
    borderRadius: 16,
    overflow: 'hidden',
    background: '#f8f9ff',
  },
  preview: {
    width: '100%',
    height: '100%',
    objectFit: 'cover',
  },
  uploadBadge: {
    position: 'absolute',
    top: 6,
    left: 6,
    background: 'rgba(0,0,0,0.6)',
    color: '#fff',
    fontSize: 10,
    padding: '2px 8px',
    borderRadius: 9999,
  },
  removeBtn: {
    position: 'absolute',
    top: 6,
    right: 6,
    width: 24,
    height: 24,
    borderRadius: '50%',
    border: 'none',
    background: 'rgba(0,0,0,0.7)',
    color: '#fff',
    fontSize: 12,
    cursor: 'pointer',
    display: 'flex',
    alignItems: 'center',
    justifyContent: 'center',
  },
  bottom: {
    display: 'flex',
    justifyContent: 'space-between',
    alignItems: 'center',
    marginTop: 8,
  },
  left: {
    display: 'flex',
    alignItems: 'center',
    gap: 8,
  },
  imageBtn: {
    background: 'transparent',
    border: 'none',
    cursor: 'pointer',
    color: '#764ba2',
    padding: 6,
    borderRadius: 9999,
  },
  imageHint: {
    fontSize: 12,
    color: '#8b95a5',
  },
  count: {
    fontSize: 13,
    color: '#8b95a5',
  },
  btn: {
    background: 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)',
    color: '#ffffff',
    fontWeight: 700,
    fontSize: 15,
    padding: '10px 24px',
    borderRadius: 9999,
    border: 'none',
    cursor: 'pointer',
    transition: 'opacity 0.15s',
  },
};
