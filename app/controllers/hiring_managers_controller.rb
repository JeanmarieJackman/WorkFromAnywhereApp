class HiringManagersController < ApplicationController

  before_action :get_hiring_manager , only: [:show,:edit,:update,:destroy]

  def show
    if @user_type == "HR" && @hiring_manager != @current_user
      redirect_to hiring_manager_path(@current_user)
    end
  end

  def new 
    @hiring_manager = HiringManager.new
    @hiring_manager.password = session[:registering_password] 
    @hiring_manager.email = session[:registering_email]
  end

  def create 
    @hiring_manager = HiringManager.new(hiring_manager_params)
    if @hiring_manager.save
      session[:user_id] = @hiring_manager.id
      session[:user_type] = "HR"
      redirect_to hiring_manager_path(@hiring_manager)
    else
      flash[erros] = @hiring_manager.errors.full_messages
      redirect_to new_hiring_manager_path
    end
  end 

  def edit 

  end 

  def update 
    if @hiring_manager.update(hiring_manager_params)
      redirect_to hiring_manager_path(@hiring_manager)
    else
      flash[erros] = @hiring_manager.errors.full_messages
      redirect_to edit_hiring_manager_path
    end
  end

  def destroy 
    @hiring_manager.destroy
    redirect_to logout_path
  end

  private 

  def hiring_manager_params 
    params.require(:hiring_manager).permit(:name,:company,:phone,:address,:fax,:email,:password)
  end

  def get_hiring_manager 
    @hiring_manager = HiringManager.find(params[:id])
  end
end
