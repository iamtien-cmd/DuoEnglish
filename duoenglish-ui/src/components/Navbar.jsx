import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../context/AuthContext';
import './Navbar.css';

function Navbar() {
  const { user, logout } = useAuth();
  const navigate = useNavigate();

  const handleLogout = () => {
    logout();
    navigate('/login');
  };

  return (
    <nav className="navbar">
      <div className="navbar-container">
        <Link to="/" className="navbar-logo">
          <span className="logo-icon">🦉</span>
          DuoEnglish
        </Link>
        <ul className="navbar-menu">
          <li><Link to="/learn">Học</Link></li>
          <li><Link to="/practice">Luyện Tập</Link></li>
          <li><Link to="/articles">Bài Viết</Link></li>
          <li><Link to="/sentences">Câu Của Tôi</Link></li>
          {user && <li><Link to="/dashboard">Thống Kê</Link></li>}
          {user ? (
            <>
              <li><Link to="/profile" className="user-link">
                <span className="user-avatar">{user.username?.charAt(0).toUpperCase()}</span>
                {user.username}
              </Link></li>
              <li><button onClick={handleLogout} className="logout-btn-nav">Đăng Xuất</button></li>
            </>
          ) : (
            <li><Link to="/login" className="login-link">Đăng Nhập</Link></li>
          )}
        </ul>
      </div>
    </nav>
  );
}

export default Navbar;
