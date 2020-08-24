module SessionsModule
    def log_in(user)
        session[:user_id] = user.id
    end

    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def current_user
        if (user_id = session[:user_id])
            User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(:id, user_id)
            if user && user.authenticated?(cookies.signed[:remember_token])
                log_in(user)
            end
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def log_out
        forget(current_user) if logged_in?
        session.delete(:user_id)
    end

    module_function :log_in, :current_user, :logged_in?, :forget, :log_out
end