class ApplicationController < ActionController::Base
    include SessionsHelper
    
    private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
        unless user_logged_in?
            redirect_to root_url
        end
    end

    # ログイン済みFPかどうか確認
    def logged_in_financial_planner
        unless financial_planner_logged_in?
            redirect_to root_url
        end
    end
end
