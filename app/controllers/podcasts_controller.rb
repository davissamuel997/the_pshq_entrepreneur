class PodcastsController < ApplicationController

  # load_and_authorize_resource param_method: :call_params

  def welcome
    p 'hello world'
  end

  def podcast_params
    params.require(:podcast)
  end

  private :podcast_params
end
