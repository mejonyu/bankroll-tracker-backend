class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        if User.find_by(username: params[:username])
            render json: {error: 'An error occurred creating your account. Please enter a unique username.'}
        else
            user = User.create(user_params)
            render json: user
        end
    end

    def update
        if User.find_by(username: params[:username])
            render json: {error: 'An error occurred creating your account. Please enter a unique username.'}
        else
            user = User.find(params[:id])
            old_username = user.username
            user.update(user_params)
            new_username = user.username
            user.update_all(old_username, new_username)
            render json: user
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user
            render json: user
        else
            render json: { error: 'Username not found. Please try again.' }
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy_completely
        render json: { message: 'Your account was successfully deleted.' }
    end

    def statistics
        user = User.find_by(id: params[:id])
        sessionsPlayed = user.number_of_sessions
        totalProfitLoss = user.total_profit_loss
        percentProfitability = user.percent_profitability
        render json: { sessionsPlayed: sessionsPlayed, totalProfitLoss: totalProfitLoss, percentProfitability: percentProfitability }
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :username, :password)
    end
end
