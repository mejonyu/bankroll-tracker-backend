class User < ApplicationRecord
    has_many :user_sessions
    has_many :sessions, through: :user_sessions

    validates :username, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def destroy_completely
        UserSession.where(user_id: self.id).delete_all
        Session.where(belongs_to: self.username).delete_all
        self.destroy
    end

    def number_of_sessions
        self.sessions.length
    end

    def total_profit_loss
        self.sessions.sum {|session| session.out_for - session.buy_in}
    end

    def percent_profitability
        profit_count = 0
        self.sessions.each do |session|
            if(session.out_for > session.buy_in)
                profit_count = profit_count + 1
            end
        end
        ((profit_count.to_f / self.number_of_sessions.to_f) * 100).round(2)
    end
end
