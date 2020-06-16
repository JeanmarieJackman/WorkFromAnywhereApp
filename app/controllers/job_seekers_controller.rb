class JobSeekersController < ApplicationController

  before_action :get_job_seeker,only: [:show,:edit,:update,:destroy]
  
  def index 
    @job_seekers = JobSeeker.all
  end

  def show 

  end

  def new 
    @job_seeker = JobSeeker.new 
  end

  def create 
    @job_seeker = JobSeeker.new(job_seeker_params)
    if @job_seeker.save
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
    redirect_to job_seekers_path
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
