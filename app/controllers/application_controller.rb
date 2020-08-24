class ApplicationController < ActionController::API
    #skip_before_action :verify_authenticity_token
    include ActionController::Cookies

    def confirm_login
        render json: {error: "ログインしてください"} unless logged_in?
        return
    end
end
