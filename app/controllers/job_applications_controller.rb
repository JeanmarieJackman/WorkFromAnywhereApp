class JobApplicationsController < ApplicationController

  def create 
    @job_application = JobApplication.create(job_application_params)
    redirect_to job_seeker_path(@job_application.job_seeker_id)
  end

  def job_application_params
    params.require(:job_application).permit(:job_listing_id,:job_seeker_id)
  end

end
