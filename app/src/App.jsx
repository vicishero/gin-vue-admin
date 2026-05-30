import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext';
import Layout from './components/Layout';
import AgeGate from './components/AgeGate';
import Splash from './pages/Splash';
import Home from './pages/Home';
import Search from './pages/Search';
import Notifications from './pages/Notifications';
import Profile from './pages/Profile';
import PostDetail from './pages/PostDetail';

export default function App() {
  return (
    <BrowserRouter>
      <AuthProvider>
        <AgeGate>
          <Layout>
            <Routes>
            <Route path="/" element={<Splash />} />
            <Route path="/home" element={<Home />} />
            <Route path="/search" element={<Search />} />
            <Route path="/notifications" element={<Notifications />} />
            <Route path="/profile" element={<Profile />} />
            <Route path="/post/:id" element={<PostDetail />} />
          </Routes>
        </Layout>
        </AgeGate>
      </AuthProvider>
    </BrowserRouter>
  );
}
