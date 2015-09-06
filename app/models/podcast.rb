class Podcast < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :images, as: :imageable

  has_attached_file :recording, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :recording, :content_type => ['audio/mpeg']

  def s3_credentials
    if Rails.env.production?
      result = {:bucket => ENV["RECORDING_BUCKET"], :access_key_id => ENV["AMAZON_ACCESS_KEY"], :secret_access_key => ENV["AMAZON_SECRET_KEY"]}
    else
  	  config = YAML.load_file(Rails.root+"config/application.yml")[Rails.env]
      result = {:bucket => config["RECORDING_BUCKET"], :access_key_id => config["AMAZON_ACCESS_KEY"], :secret_access_key => config["AMAZON_SECRET_KEY"]}
    end

    result
  end

  def get_podcast_image
    if self.images.present? && self.images.count > 0 && self.images.first.attachment.present? && self.images.first.attachment.url.present?
      image = self.images.first.attachment.url
    else
      image = "http://s3.amazonaws.com/pshq_entrepreneur_recordings/images/attachments/000/000/010/original/PSHQ-Entrepreneur-Cover-Show-small.jpg?1441206717" 
    end

    image
  end

  def get_podcast_recording
    if self.recording.present? && self.recording.url.present? && self.recording.url.size > 0
      recording = self.recording.url
    else
      recording = nil
    end

    recording
  end

  def self.get_podcasts(options = {})
  	data = {:errors => false}

    page_num = (options[:page] || 1).to_i
    per_page = 10

    podcasts = Podcast.all.page(page_num).per(per_page).order('created_at DESC')

  	data[:podcasts] = podcasts.map { |podcast| {
  			podcast_id:     podcast.id,
  			name:           podcast.name,
  			air_date:       podcast.air_date.present? ? podcast.air_date.strftime('%m/%d/%Y') : nil,
  			description:    podcast.description,
  			recording:      podcast.get_podcast_recording,
        image:          podcast.get_podcast_image,
        summary:        podcast.summary,
        episode_number: podcast.episode_number
  		} 
  	}

    data[:pagination] = Podcast.pagination_data Podcast.all.count, page_num, per_page

  	data
  end

  # Required - podcast_id
  # On Success - returns podcast object
  def self.find_podcast(options = {})
    data = {:errors => false}

    if options[:podcast_id].present? && options[:podcast_id].to_i > 0
      podcast = Podcast.find(options[:podcast_id])

      data[:podcast] = {
        podcast_id:     podcast.id,
        name:           podcast.name,
        air_date:       podcast.air_date.present? ? podcast.air_date.strftime('%m/%d/%Y')  : nil,
        description:    podcast.description,
        summary:        podcast.summary,
        episode_number: podcast.episode_number,
        recording:      podcast.get_podcast_recording,
        image:          podcast.get_podcast_image,
        comments:       podcast.comments.order('post_date ASC').map{ |comment| {
            comment_id:  comment.id,
            user:        comment.user_id.present? && comment.user_id.to_i > 0 ? User.find(comment.user_id) : nil,
            post_date:   comment.post_date.present? ? comment.post_date.strftime('%m/%d/%Y at %I:%M %p') : nil,
            description: comment.description,
            approved:    comment.approved
          }
        }
      } 
    else
      data[:errors] = true
    end

    data
  end

  def self.update_podcast(options = {}, need_parse = false)
    data = {:errors => false}

    if options[:podcast_id].present? && options[:podcast_id].to_i > 0 && options[:podcast_params].present?

      podcast = Podcast.find(options[:podcast_id])

      # podcast_params = need_parse ? JSON.parse(options[:podcast_params]) : options[:podcast_params]
      podcast_params = options[:podcast_params]

      unless podcast.update!(description:    options[:description], name: podcast_params["name"],
                             air_date:       podcast_params["air_date"], summary: podcast_params["summary"],
                             episode_number: podcast_params["episode_number"])
        data[:errors] = true
      end

    else
      data[:errors] = true
    end

    data
  end

  def self.create_podcast_comment(options = {})
    data = {:errors => false}

    if options[:podcast_id].present? && options[:podcast_id].to_i > 0 && options[:comment_description].present? && options[:comment_description].length > 0 && options[:user_id].present? && options[:user_id].to_i > 0
      podcast = Podcast.find(options[:podcast_id])

      # Will have to refactor to take into account "approved"
      comment = podcast.comments.new(user_id: options[:user_id], post_date: Time.now,
                                     description: options[:comment_description], approved: true)

      if comment.save
        data[:comments] = podcast.comments.order('post_date ASC').map{ |comment| {
            comment_id:  comment.id,
            user:        comment.user_id.present? && comment.user_id.to_i > 0 ? User.find(comment.user_id) : nil,
            post_date:   comment.post_date.present? ? comment.post_date.strftime('%m/%d/%Y at %I:%M %p') : nil,
            description: comment.description,
            approved:    comment.approved
          }  
        }
      else
        data[:errors] = true
      end
    else
      data[:errors] = true
    end

    data
  end

  # This paginates all of the data for the response of the js.
  def self.pagination_data element_count, current_page, results_per_page
    page  = current_page.to_i
    pages = (element_count / results_per_page.to_f).ceil

    if pages <= 1
      pages = 1
      relevant_pages = []
    else
      # If possible, add the two previous and two next pages to the 'relevant pages' array
      previous_pages = page - 2 < 1 ? (1..page).to_a : ( (page - 2)..page ).to_a
      next_pages     = page + 2 > pages ? ( (page+1)..pages ).to_a : ( (page+1)..(page + 2) ).to_a
      relevant_pages = previous_pages + next_pages

      # Add the first and last page to the 'relevant pages' array if they are not present
      relevant_pages.unshift(1) unless relevant_pages.first == 1
      relevant_pages << pages   unless relevant_pages.last == pages
    end

    { total_items: element_count, pages: pages, relevant_pages: relevant_pages }
  end

end
