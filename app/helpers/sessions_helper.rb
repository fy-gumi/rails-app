module SessionsHelper
    # 渡されたユーザーでログインする
    def user_log_in(user)
        log_out
        session[:user_id] = user.id
        current_user
    end
    
    # 現在ログイン中のユーザーを返す（いる場合）
    def current_user
        if session[:user_id]
            # find だとユーザーがログインしていない場合に例外が発生するので find_by で検索
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    #受け取ったユーザーがログイン中のユーザーと一致すれば true を返す
    def current_user?(user)
        user == current_user
    end

    # ユーザーがログインしていれば true、その他なら false を返す
    def user_logged_in?
        !current_user.nil?
    end

    # 渡されたFPでログインする
    def financial_planner_log_in(financial_planner)
        log_out
        session[:financial_planner_id] = financial_planner.id
        current_financial_planner
    end
    
    # 現在ログイン中のFPを返す（いる場合）
    def current_financial_planner
        if session[:financial_planner_id]
            # find だとFPがログインしていない場合に例外が発生するので find_by で検索
            @current_financial_planner ||= FinancialPlanner.find_by(id: session[:financial_planner_id])
        end
    end

    #受け取ったFPがログイン中のFPと一致すれば true を返す
    def current_financial_planner?(financial_planner)
        financial_planner == current_financial_planner
    end

    # FPがログインしていれば true、その他なら false を返す
    def financial_planner_logged_in?
        !current_financial_planner.nil?
    end

    # ログアウトする
    def log_out
        session.delete(:user_id)
        session.delete(:financial_planner_id)
        @current_user = nil
        @current_financial_planner = nil
    end
end
