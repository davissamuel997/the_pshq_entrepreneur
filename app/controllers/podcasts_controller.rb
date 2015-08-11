class PodcastsController < ApplicationController

  # load_and_authorize_resource param_method: :call_params

  respond_to :json, :html

  def welcome
  end

  def get_podcasts
  	response = Podcast.get_podcasts(params)

  	respond_with response
  end

  def podcast_params
    params.require(:podcast).permit(:recording, :name, :air_date, :created_by)
  end

  private :podcast_params
end
