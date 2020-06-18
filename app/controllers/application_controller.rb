class ApplicationController < ActionController::Base
  include ActionView::Helpers::UrlHelper

  before_action :get_user 
  before_action :auth_user
  before_action :redirect_home

  def get_user 
    if (session[:user_type] == "HR")
      @current_user = HiringManager.find_by(id:session[:user_id])
    elsif (session[:user_type] == "JS")
      @current_user = JobSeeker.find_by(id:session[:user_id])
    end
    @user_type = session[:user_type]
  end

  def auth_user
    if @current_user
      # Continue on into app
    else 
      flash[:errors] = ["You need to login to have access"]
      redirect_to root_path
    end  
  end 

  def redirect_home
    if @current_user && current_page?(root_path)
      if @user_type == "HR"
        redirect_to hiring_manager_path(@current_user)
      elsif @user_type == "JS"
        redirect_to job_seeker_path(@current_user)
      end
    end
  end

end
