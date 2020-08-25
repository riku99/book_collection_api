class Api::V1::SessionsController < ApplicationController
    include SessionsModule
    def create
        unless user = User.find_by(username: params[:user][:username])
            render json: {failer: "ユーザーが存在しません"}
            return
        end
        if user && user.authenticate(params[:user][:password])
            log_in(user)
            remember(user)
            render json: {
                current_user: user
            }
        else
            render json: {failer: "パスワードが違います"}
        end
    end

    def destroy
        log_out
    end

    def check
        if current_user
            render json: {current_user: current_user}
        else
            render json: {current_user: nil}
        end
    end
end
