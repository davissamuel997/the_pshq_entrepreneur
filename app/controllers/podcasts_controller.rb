class PodcastsController < ApplicationController

  # load_and_authorize_resource param_method: :call_params

  skip_before_filter :authenticate_user!, only: [:welcome, :get_podcasts, :find_podcast]

  respond_to :json, :html

  def welcome
  end

  def get_podcasts
  	response = Podcast.get_podcasts(params)

  	respond_with response
  end

  def find_podcast
    response = Podcast.find_podcast(params)

    respond_with response
  end

  def podcast_params
    params.require(:podcast).permit(:recording, :name, :air_date, :created_by)
  end

  private :podcast_params
end
