class ApplicationController < ActionController::Base
    # before ANY actions anywhere else! any other methods
    # request things anywhere else
    before_action :set_current_user

    def set_current_user
         # load user if user is logged in
         if session[:user_id]
            # find_by will not throw error if cannot find user
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def require_user_logged_in!
        redirect_to sign_in_path, alert: "You must be signed in first!" if Current.user.nil?
    end
end
