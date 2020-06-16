class JobListingsController < ApplicationController

  def index 
    @job_listings = JobListing.all 
  end

  def show
    @job_listing = JobListing.find(params[:id])
  end

  def new 
    @job_listing = JobListing.new
    @job_listing.hiring_manager = @current_user
  end 

  def create 

  end 

  def destroy 
    @job_listing = JobListing.find(params[:id])
    @jjob_listing.destroy
  end 


end
