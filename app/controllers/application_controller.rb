class ApplicationController < ActionController::Base
  before_action :get_user 

  def get_user 
    if (session[:user_type] == "HR")
      @current_user = HiringManager.find_by(id:session[:user_id])
    elsif (session[:user_type] == "JS")
      @current_user = JobSeeker.find_by(id:session[:user_id])
    end
    @user_type = session[:user_type]
  end

end
