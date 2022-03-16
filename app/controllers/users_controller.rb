class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy login ]
  before_action :logged_in_user, only: %i[index home reserve ]

  def login 
    user_log_in @user
    redirect_to '/user/home'
  end

  def home 
    @today = Time.current
    @day_count = 6
    @reserve_list = user_reserve_list
    
    render "users/home"
  end

  def reserve
    reserve = Reserve.find_by(reserve_date: Time.current.since(params[:reserve_date].to_i.days), time_zone_code: params[:time_zone_code])
    reserve.user_id = session[:user_id]
    reserve.save
    
    redirect_to '/user/home'
  end
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:user_name)
    end

    def user_reserve_list
      reserve_available_list = Reserve.where(reserve_date: [@today..@today.since(@day_count.days)]).where(user_id: nil)
      reserved_list = Reserve.where(reserve_date: [@today..@today.since(@day_count.days)]).where(user_id: @current_user.id)

      reserve_list = []
      row = []

      (0..Reserve::TIME_ZONE.size-1).each do |x|
        (0..@day_count).each do |y|
          row << 0
        end
        reserve_list << row
        row = []
      end

      reserve_available_list.each do |reserve|
        diff_date = reserve.reserve_date - Date.today
        reserve_list[reserve.time_zone_code][diff_date] = 2
      end

      reserved_list.each do |reserve|
        diff_date = reserve.reserve_date - Date.today
        reserve_list[reserve.time_zone_code][diff_date] = 3
      end
      return reserve_list
    end
end
