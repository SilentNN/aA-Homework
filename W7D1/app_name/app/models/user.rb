class User < ApplicationRecord
    before_validation :ensure_session_token
    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: { message: "Password can't be blank" }
    validates :password, length: {minimum: 6, allow_nil: true}

    attr_reader :password

    def self.find_by_credentials(uname, pword)
        user = User.find_by(username: uname)
        return user if user && BCrypt::Password.new(user.password_digest).is_password?(password)
        nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        @session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(pword)
        @password = pword
        self.password_digest = BCrypt::Password.create(@password)
    end
end