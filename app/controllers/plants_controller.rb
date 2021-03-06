class PlantsController < ApplicationController
  before_action :authenticate_user!
  # before_action except: [:new, :create, :show] do
  #   unless is_user?
  #     flash[:alert] = 'You do not have access to my plants!'
  #       redirect_to plants_path
  #     end
  #   end

  def index
    @user = current_user
    @plants = @user.plants.order(:name).page params[:page]
    render :index
  end

  def tasks
    @user = current_user
    @plants = @user.plants
    start_date = params.fetch(:start_date, Date.today).to_date
    @meetings = @plants.where(water_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).first
    render :tasks
  end

  def water_update
    @plant = Plant.find(params[:plant_id].to_i)
    if @plant.update({:water_time => @plant.wait_time})
      flash[:notice] = "Plant watering updated! next date is #{@plant.water_time.month}-#{@plant.water_time.day}"
      redirect_to plants_tasks_path
    else
      @user = current_user
      flash[:notice] = "Update failed. Please try again"
      redirect_to plants_path
    end
  end

  def new
    @user = current_user
    @plant = @user.plants.new
    render :new
  end

  def create
    @user = current_user
    @plant = @user.plants.new(plant_params)
    @plant.photo.attach(params[:plant][:photo])
    @plant.wait_time #this adds the watering date
    if @plant.save
      flash[:notice] = "Plant added!"
      redirect_to plants_path
    else
      render :new
    end
  end

  def show
    @user = current_user
    @plant = Plant.find(params[:id])
    @api_response = HTTParty.get("http://openfarm.cc/api/v1/crops/?filter=#{@plant.name}")
    if @plant.water_time < Time.now && @plant.user_id != current_user.id
      flash[:alert] = "This plant needs water! Please reach out to your friend"
      render :show
    else
      render :show
    end
  end

  def edit
    @user = current_user
    @plant = Plant.find(params[:id])
    render :edit
  end

  def update
    @plant = Plant.find(params[:id])
    if current_user.id == @plant.user_id
      if @plant.update(plant_params)
        flash[:notice] = "Plant updated!"
        redirect_to plant_path
      else
        @user = current_user
        flash[:notice] = "Update failed. Please try again!"
        render :edit
      end
    else
      @user = current_user
      flash[:notice] = "Hey! Stop Trying to update your friends' plants!"
      redirect_to users_profile_path
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    flash[:notice] = "Plant deleted!"
    redirect_to plants_path
  end

  private
  def plant_params
    params.require(:plant).permit(:name, :category, :health, :health_next_update, :photo, :water_time)
  end
end