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
            render json: {error: 'An error occurred creating your account. Please enter a first name, last name, and a unique username.'}
        else
            user = User.create(user_params)
            render json: user
        end
    end

    def login
        user = User.find_by(username: params[:username])
        if user
            render json: user
        else
            render json: {error: 'Username not found. Please try again.'}
        end
    end

    private

    def user_params
        params.permit(:first_name, :last_name, :username, :password)
    end
end
