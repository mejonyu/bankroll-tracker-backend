class SessionsController < ApplicationController
    def index
        sessions = Session.all.order('id')
        render json: sessions
    end

    def show
        session = Session.find(params[:id])
        render json: session
    end

    def create
        session = Session.create(session_params)
        session.belongs_to = params[:username]
        session.save
        UserSession.create(user_id: params[:user_id], session_id: session.id)
        render json: session
    end

    def update
        session = Session.find(params[:id])
        session.update(session_params)
        render json: session
    end

    def overall_user_sessions
        sessions = Session.where("belongs_to = '#{params[:user]}'").order('id')
        render json: sessions
    end

    def destroy
        session = Session.find(params[:id])
        session.destroy_completely
        render json: { message: 'Your session was successfully deleted.' }
    end

    private

    def session_params
        params.permit(:stakes, :hours_played, :location, :belongs_to, :buy_in, :out_for)
    end
end
