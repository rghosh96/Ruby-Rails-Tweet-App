# needs to match file name in CamelCase
# inherits from ApplicationController to get all funtionality
class SessionsController < ApplicationController
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "You have been logged out!"
    end

    def new
    end

    def create
        # find user in db by email
        user = User.find_by(email: params[:email])
        # check if email exists & password matches (authenticate comes w rails)
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: "Successfully logged in!"
        else
            flash[:alert] = "We did not recognize your email or password!"
            render :new
        end
    end
end