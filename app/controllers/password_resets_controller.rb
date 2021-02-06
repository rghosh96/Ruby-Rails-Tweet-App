class PasswordResetsController < ApplicationController
    def new
    end

    def create
        @user = User.find_by(email: params[:email])

        if @user.present?
            # send email to certain person (with)
            # deliver_later sends email out in a background job (efficiency)
            PasswordMailer.with(user: @user).reset.deliver_now
        end

        redirect_to root_path, notice: "If an account with that email was found,
                an email link was sent to reset your password!"
    end

    def edit
        # look for user with signed id
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        rescue ActiveSupport::MessageVerifier::InvalidSignature
            redirect_to sign_in_path, alert: "You did not reset your password in time. ): Please try again!"
    end

    def update
        # look for user with signed id
        @user = User.find_signed!(params[:token], purpose: "password_reset")
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Your password was successfully reset! Please sign in."
        else
            render :edit
        end
    end

    private

    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end
end