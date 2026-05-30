export const API_BASE = import.meta.env.VITE_API_BASE || 'http://localhost:8888';

async function request(path, options = {}) {
  const token = localStorage.getItem('h5_token');
  const headers = { ...options.headers };
  if (token) headers['x-token'] = token;
  if (!headers['Content-Type'] && options.body && !(options.body instanceof FormData)) {
    headers['Content-Type'] = 'application/json';
  }

  const res = await fetch(`${API_BASE}${path}`, { ...options, headers });
  const data = await res.json();

  const newToken = res.headers.get('new-token');
  if (newToken) localStorage.setItem('h5_token', newToken);

  if (data.code !== 0) {
    if (res.status === 401 || data.code === 7) {
      localStorage.removeItem('h5_token');
      window.dispatchEvent(new Event('auth-logout'));
    }
    throw new Error(data.msg || 'request failed');
  }
  return data;
}

export function get(path) {
  return request(path, { method: 'GET' });
}

export function post(path, body) {
  return request(path, {
    method: 'POST',
    body: body instanceof FormData ? body : JSON.stringify(body),
  });
}

export function put(path, body) {
  return request(path, { method: 'PUT', body: JSON.stringify(body) });
}

export function del(path) {
  return request(path, { method: 'DELETE' });
}

// Auth APIs
export async function getNonce(walletAddress) {
  const params = new URLSearchParams({ walletAddress });
  return get(`/app/auth/nonce?${params}`);
}

export async function walletLogin(walletAddress, signature) {
  return post('/app/auth/login', { walletAddress, signature });
}

// User APIs
export async function getProfile() {
  return get('/app/user/profile');
}

export async function updateProfile(data) {
  return put('/app/user/profile', data);
}

export async function getUserProfile(id) {
  return get(`/app/user/profile/${id}`);
}

// Post APIs
export async function createPost(data) {
  return post('/app/post', data);
}

export async function getFeed(params) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/post/feed?${qs}`);
}

export async function getPost(id) {
  return get(`/app/post/${id}`);
}

export async function deletePost(id) {
  return del(`/app/post/${id}`);
}

// Like / Collect
export async function toggleLike(postId) {
  return post('/app/post/like', { postId });
}

export async function toggleCollect(postId) {
  return post('/app/post/collect', { postId });
}

export async function getLiked(params) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/post/liked?${qs}`);
}

export async function getCollected(params) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/post/collected?${qs}`);
}

// Comment APIs
export async function createComment(postId, content) {
  return post('/app/comment', { postId, content });
}

export async function getComments(postId, params = {}) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/comment/list/${postId}?${qs}`);
}

export async function deleteComment(id) {
  return del(`/app/comment/${id}`);
}

export async function createReply(commentId, content, atUserId = 0) {
  return post('/app/comment/reply', { commentId, content, atUserId });
}

export async function getReplies(commentId, params = {}) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/comment/replies/${commentId}?${qs}`);
}

// Follow APIs
export async function follow(targetId) {
  return post('/app/user/follow', { targetId });
}

export async function unfollow(targetId) {
  return post('/app/user/unfollow', { targetId });
}

export async function getFollowings(params = {}) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/user/followings?${qs}`);
}

export async function getFollowers(params = {}) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/user/followers?${qs}`);
}

// Tag APIs
export async function getTags() {
  return get('/app/tag/list');
}

// Notification APIs
export async function getNotifications(params = {}) {
  const qs = new URLSearchParams(params).toString();
  return get(`/app/notification/list?${qs}`);
}

export async function markNotificationsRead(ids) {
  return put('/app/notification/read', { ids });
}

export async function getUnreadCount() {
  return get('/app/notification/unread-count');
}

// Upload
export async function uploadImage(file) {
  const formData = new FormData();
  formData.append('file', file);
  return post('/app/upload/image', formData);
}

// Utility
export function relativeTime(dateStr) {
  const now = Date.now();
  const then = new Date(dateStr).getTime();
  const diff = Math.floor((now - then) / 1000);
  if (diff < 60) return 'just now';
  if (diff < 3600) return `${Math.floor(diff / 60)}m`;
  if (diff < 86400) return `${Math.floor(diff / 3600)}h`;
  if (diff < 2592000) return `${Math.floor(diff / 86400)}d`;
  return new Date(dateStr).toLocaleDateString();
}
