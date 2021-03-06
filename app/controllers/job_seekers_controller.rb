class JobSeekersController < ApplicationController
  skip_before_action :auth_user, only: [:index,:new,:create]
  before_action :get_job_seeker,only: [:show,:edit,:update,:destroy]
  
  def index 
    @job_seekers = JobSeeker.all.paginate(page: params[:page], per_page: 15)
  end

  def show 

    if @user_type == "JS" && @job_seeker != @current_user
      redirect_to job_seeker_path(@current_user)
    end
  end

  def new 
    @job_seeker = JobSeeker.new 
    @job_seeker.password = session[:registering_password] 
    @job_seeker.email = session[:registering_email]
  end

  def create 
    @job_seeker = JobSeeker.new(job_seeker_params)
    if @job_seeker.save
      session[:user_id] = @job_seeker.id
      session[:user_type] = "JS"
      redirect_to job_seeker_path(@job_seeker)
    else
      flash[erros] = @job_seeker.errors.full_messages
    end
  end 

  def edit 

  end

  def update 
    if @job_seeker.update(job_seeker_params)
      redirect_to job_seeker_path(@job_seeker)
    else
      flash[erros] = @job_seeker.errors.full_messages
    end
  end

  def destroy
    @job_seeker.destroy
    redirect_to logout_path
  end

  private 

  def job_seeker_params 
    params.require(:job_seeker).permit(
      :name,
      :email,
      :password,
      :address,
      :profile_picture,
      :phone,
      :resume_link,
      :website_link,
      :title_tagline
      )
  end

  def get_job_seeker 
    @job_seeker = JobSeeker.find(params[:id])
  end

end
