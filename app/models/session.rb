class Session < ApplicationRecord
    has_many :user_sessions
    has_many :users, through: :user_sessions

    validates :buy_in, presence: true
    validates :out_for, presence: true
end
