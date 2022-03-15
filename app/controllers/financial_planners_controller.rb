class FinancialPlannersController < ApplicationController
  before_action :set_financial_planner, only: %i[ show edit update destroy login ]
  before_action :logged_in_financial_planner, only: %i[index home]

  def login
    financial_planner_log_in @financial_planner
    redirect_to '/financial_planner/home'
  end

  def home
    @financial_planners = FinancialPlanner.all
    render "financial_planners/home"
  end

  # GET /financial_planners or /financial_planners.json
  def index
    @financial_planners = FinancialPlanner.all
  end

  # GET /financial_planners/1 or /financial_planners/1.json
  def show
  end

  # GET /financial_planners/new
  def new
    @financial_planner = FinancialPlanner.new
  end

  # GET /financial_planners/1/edit
  def edit
  end

  # POST /financial_planners or /financial_planners.json
  def create
    @financial_planner = FinancialPlanner.new(financial_planner_params)

    respond_to do |format|
      if @financial_planner.save
        format.html { redirect_to financial_planner_url(@financial_planner), notice: "Financial planner was successfully created." }
        format.json { render :show, status: :created, location: @financial_planner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @financial_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financial_planners/1 or /financial_planners/1.json
  def update
    respond_to do |format|
      if @financial_planner.update(financial_planner_params)
        format.html { redirect_to financial_planner_url(@financial_planner), notice: "Financial planner was successfully updated." }
        format.json { render :show, status: :ok, location: @financial_planner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @financial_planner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_planners/1 or /financial_planners/1.json
  def destroy
    @financial_planner.destroy

    respond_to do |format|
      format.html { redirect_to financial_planners_url, notice: "Financial planner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financial_planner
      @financial_planner = FinancialPlanner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def financial_planner_params
      params.require(:financial_planner).permit(:financial_planner_name)
    end
end
