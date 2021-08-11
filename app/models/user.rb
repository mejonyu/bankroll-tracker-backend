class User < ApplicationRecord
    has_many :user_sessions
    has_many :sessions, through: :user_sessions

    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
end
