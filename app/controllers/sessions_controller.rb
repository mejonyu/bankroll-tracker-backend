class SessionsController < ApplicationController
    def index
        sessions = Session.all
        render json: sessions
    end

    def show
        session = Session.find(params[:id])
        render json: session
    end

    def create
        session = Session.create(session_params)
        session.belongs_to = params[:username]
        UserSession.create(user_id: params[:user_id], session_id: session.id)
        byebug
        render json: session
    end

    def index_for_user
        sessions = Session.where("belongs_to = '#{params[:user]}'")
        render json: sessions
    end

    private

    def session_params
        params.permit(:stakes, :hours_played, :location, :belongs_to, :buy_in, :out_for)
    end
end