class HiringManagersController < ApplicationController

  before_action :get_hiring_manager , only: [:show,:edit,:update,:destroy]

  def show

  end

  def new 
    @hiring_manager = HiringManager.new
  end

  def create 

  end 

  def edit 

  end 

  def update 

  end

  def destroy 

  end

  private 

  def hiring_manager_params 

  end

  def get_hiring_manager 
    @hiring_manager = HiringManager.find(params[:id])
  end
end
