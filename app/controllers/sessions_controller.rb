class SessionsController < ApplicationController
    
    def create
        user = User.find_by(username: params[:username])
        if user
            session[:user_id] = user.id
            render json: user
        else
            render json: {error: "TAKE THIS!"}, status: :unauthorized
        end

        # How does session know about the user_id? Which table is it pulling this data from? Is the hash empty until we tell it what to take in for the session?
    end

    def destroy
        session.delete :user_id
        # session is filled or compiled of what information just the user id? What is inside the hash of a session?
        head :no_content
    end
end
