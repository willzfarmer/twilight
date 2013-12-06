class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:email], params[:session][:password])
            sign_in user
            redirect_back_or user
        else
            flash.now[:error] = 'Invalid email/password combination'
            redirect_to login_url
        end
    end

    def destroy
        sign_out
        redirect_to root_url
    end
end