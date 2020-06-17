class JobListingsController < ApplicationController

  def index 
    @job_listings = JobListing.where("job_filled_status = ?",false).paginate(page: params[:page], per_page: 15)
  end

  def show
    @job_listing = JobListing.find(params[:id])
  end

  def new 
    @job_listing = JobListing.new
    @job_listing.hiring_manager = @current_user
  end 

  def create 
    @job_listing = JobListing.new(job_listing_params)

    if @job_listing.save 
      redirect_to hiring_manager_path(@job_listing.hiring_manager_id)
    else
      flash[errors] = @job_listing.errors.full_messages
    end
  end 

  def fill_position 
    @job_listing = JobListing.find(params[:id])
    @job_listing.job_filled_status = true;
    @job_listing.save 
    redirect_to job_listing_path(@job_listing)
  end

  def destroy 
    @job_listing = JobListing.find(params[:id])
    @jjob_listing.destroy
  end 

  private 
  def job_listing_params 
    params.require(:job_listing).permit(:title,:description,:duration,:hiring_manager_id)
  end 
end
