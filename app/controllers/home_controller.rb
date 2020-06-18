class HomeController < ApplicationController
  skip_before_action :auth_user, only: [:welcome,:login_screen, :redirecting,:login]
  def welcome

  end

  def login_screen

  end

  def redirecting
    session[:registering_email] = params[:email]
    session[:registering_password] = params[:password]
    if(params[:user_type]== "Hiring Manager")
      redirect_to new_hiring_manager_path
    elsif (params[:user_type]== "Job Seeker")
      redirect_to new_job_seeker_path
    end
  end

  def login
    if(params[:user_type]== "Job Seeker")
      job_seeker = JobSeeker.where("email = ? and password = ? ",params[:email],params[:password]).first
      if job_seeker
        session[:user_id] = job_seeker.id
        session[:user_type] = "JS"
        redirect_to job_seeker_path(job_seeker)
        return 
      else
        flash[:errors] = ["Credentials could not be found"]
      end
    elsif (params[:user_type]== "Hiring Manager")
      hiring_manager = HiringManager.where("email = ? and password = ? ",params[:email],params[:password]).first
      if hiring_manager
        session[:user_id] = hiring_manager.id
        session[:user_type] = "HR"
        redirect_to hiring_manager_path(hiring_manager)
        return
      else
        flash[:errors] = ["Credentials could not be found"]
      end
    end
    redirect_to login_screen_path
  end

  def logout
    session.delete(:user_id)
    session.delete(:user_type)
    redirect_to '/'
  end
 
end
