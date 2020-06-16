class HomeController < ApplicationController
  def welcome

  end

  def login_screen

  end

  def redirecting
    session[:registering_email] = params[:email]
    session[:registering_password] = params[:email]
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
      else
        flash[:errors] = ["Credentials could not be found"]
      end
    elsif (params[:user_type]== "Hiring Manager")
      hiring_manager = HiringManager.where("email = ? and password = ? ",params[:email],params[:password]).first
      if hiring_manager
        session[:user_id] = hiring_manager.id
        session[:user_type] = "HR"
        redirect_to hiring_manager_path(hiring_manager)
      else
        flash[:errors] = ["Credentials could not be found"]
      end
    end
  end

  def logout

  end
 
end
