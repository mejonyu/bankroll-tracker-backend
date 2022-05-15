class Session < ApplicationRecord
    has_many :user_sessions
    has_many :users, through: :user_sessions

    validates :location, presence: true
    validates :stakes, presence: true
    validates :buy_in, presence: true
    validates :out_for, presence: true

    def destroy_completely
        UserSession.where(session_id: self.id).delete_all
        self.destroy
    end
end
