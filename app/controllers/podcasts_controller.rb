class PodcastsController < ApplicationController

  # load_and_authorize_resource param_method: :call_params

  skip_before_filter :authenticate_user!, only: [:welcome, :get_podcasts, 
                                                 :find_podcast, :update_podcast]

  respond_to :json, :html

  def welcome
  end

  def get_podcasts
  	response = Podcast.get_podcasts(params)

    if current_user.present?
      response["current_user"] = current_user
    end

  	respond_with response
  end

  def find_podcast
    response = Podcast.find_podcast(params)

    if current_user.present?
      response["current_user"] = current_user
    end

    respond_with response
  end

  def update_podcast
    response = Podcast.update_podcast(params, true)

    respond_with response

    # data = {:errors => false}

    # if params[:podcast_id].present? && params[:podcast_id].to_i > 0 && params[:podcast_params].present?

    #   podcast = Podcast.find(params[:podcast_id])

    #   # podcast_params = need_parse ? JSON.parse(options[:podcast_params]) : options[:podcast_params]
    #   podcast_params = params[:podcast_params]

    #   if params[:description].present? && params[:description].size > 0
    #     podcast_params["description"] = params[:description]
    #   end

    #   unless podcast.update!(podcast_params)
    #     data[:errors] = true
    #   end
    # else
    #   data[:errors] = true
    # end

    # respond_with data
  end

  def create_podcast_comment
    params["user_id"] = current_user.id

    response = Podcast.create_podcast_comment(params)

    respond_with response
  end

  def podcast_params
    params.require(:podcast).permit(:name, :air_date, :created_by, :description, :summary, :episode_number)
  end

  private :podcast_params
end
