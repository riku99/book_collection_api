class Api::V1::UsersController < ApplicationController
    include SessionsModule
    def create
        user = User.new(user_params)
        if user.save
            log_in(user)
            render json: {
                logged_in: true,
                user: {
                    username: user.username
                }
            }
        else
            message = user.errors.full_messages
            render json: {
                error: message[0]
            }
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
