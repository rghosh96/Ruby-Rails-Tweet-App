# needs to match file name in CamelCase
# inherits from ApplicationController to get all funtionality
class RegistrationsController < ApplicationController
    def new
        # use instance variables so it can be visible in the views
        @user = User.new
    end

    def create
        # data returned from form submitted in new is in params! user data in user
        # use private function to assign only certain items
        @user = User.new(user_params)
        # if we save to db successfully, redirect to root_path; else re-render page
        if @user.save  
            # to log in a user more securely, session is an encrypted hash in ruby
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Successfully created account!"
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end