import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import axios from 'axios';
import './AuthPages.css';

const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:8080/api';

function ForgotPasswordPage() {
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [sent, setSent] = useState(false);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setError('');
    setMessage('');

    try {
      // Gọi API reset password (cần implement ở backend)
      const response = await axios.post(`${API_URL}/auth/forgot-password`, { email });
      
      setMessage('Đã gửi email hướng dẫn đặt lại mật khẩu. Vui lòng kiểm tra hộp thư của bạn.');
      setSent(true);
    } catch (err) {
      // Tạm thời hiển thị thông báo giả vì backend chưa có API này
      setMessage('Chức năng đặt lại mật khẩu đang được phát triển. Vui lòng liên hệ admin để được hỗ trợ.');
      setSent(true);
      // setError(err.response?.data?.error || 'Có lỗi xảy ra. Vui lòng thử lại.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="auth-container">
      <div className="auth-card">
        <div className="auth-header">
          <span className="auth-icon">🔑</span>
          <h2>Quên Mật Khẩu?</h2>
          <p>Nhập email của bạn để nhận hướng dẫn đặt lại mật khẩu</p>
        </div>

        {!sent ? (
          <form onSubmit={handleSubmit} className="auth-form">
            {error && <div className="error-message">{error}</div>}

            <div className="form-group">
              <label>Email</label>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
                placeholder="Nhập email đã đăng ký"
                autoComplete="email"
              />
            </div>

            <button type="submit" className="submit-btn" disabled={loading}>
              {loading ? 'Đang gửi...' : 'Gửi Email'}
            </button>
          </form>
        ) : (
          <div className="success-message">
            <div className="success-icon">✅</div>
            <p>{message}</p>
            <Link to="/login" className="submit-btn" style={{ textDecoration: 'none', display: 'block', textAlign: 'center' }}>
              Quay lại Đăng nhập
            </Link>
          </div>
        )}

        <div className="auth-footer">
          <Link to="/login" className="auth-link">
            ← Quay lại đăng nhập
          </Link>
        </div>
      </div>
    </div>
  );
}

export default ForgotPasswordPage;
