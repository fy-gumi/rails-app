class HomeController < ApplicationController
  def index
    @users = User.all
    @financial_planners = FinancialPlanner.all
  end
end
