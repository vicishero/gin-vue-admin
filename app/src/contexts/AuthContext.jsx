import { createContext, useContext, useState, useCallback, useEffect } from 'react';
import { getNonce, walletLogin, getProfile } from '../utils/api';

const AuthContext = createContext(null);

export function AuthProvider({ children }) {
  const [user, setUser] = useState(null);
  const [token, setToken] = useState(() => localStorage.getItem('h5_token'));
  const [loading, setLoading] = useState(false);

  const login = useCallback(async (walletAddress, signMessage) => {
    setLoading(true);
    try {
      const nonceRes = await getNonce(walletAddress);
      const signature = await signMessage(nonceRes.data.nonce);
      const loginRes = await walletLogin(walletAddress, signature);

      localStorage.setItem('h5_token', loginRes.data.token);
      setToken(loginRes.data.token);
      setUser(loginRes.data.user);
      return loginRes.data.user;
    } finally {
      setLoading(false);
    }
  }, []);

  const logout = useCallback(() => {
    localStorage.removeItem('h5_token');
    setToken(null);
    setUser(null);
  }, []);

  const refreshUser = useCallback(async () => {
    if (!token) return;
    try {
      const res = await getProfile();
      setUser(res.data);
    } catch {
      logout();
    }
  }, [token, logout]);

  useEffect(() => {
    if (token && !user) {
      refreshUser();
    }
  }, [token, user, refreshUser]);

  useEffect(() => {
    const handler = () => logout();
    window.addEventListener('auth-logout', handler);
    return () => window.removeEventListener('auth-logout', handler);
  }, [logout]);

  return (
    <AuthContext.Provider value={{ user, token, loading, login, logout, refreshUser, isAuthenticated: !!user }}>
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const ctx = useContext(AuthContext);
  if (!ctx) throw new Error('useAuth must be used within AuthProvider');
  return ctx;
}
