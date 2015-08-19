class Podcast < ActiveRecord::Base

  has_many :comments, as: :commentable

  has_attached_file :recording, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :recording, :content_type => ['audio/mpeg']

  def s3_credentials
  	config = YAML.load_file(Rails.root+"config/application.yml")[Rails.env]

    {:bucket => config["RECORDING_BUCKET"], :access_key_id => config["AMAZON_ACCESS_KEY"], :secret_access_key => config["AMAZON_SECRET_KEY"]}
  end

  def self.get_podcasts(options = {})
  	data = {:errors => false}

    page_num = (options[:page] || 1).to_i
    per_page = 10

    podcasts = Podcast.all.page(page_num).per(per_page).order('created_at DESC')

  	data[:podcasts] = podcasts.map { |podcast| {
  			podcast_id:  podcast.id,
  			name:        podcast.name,
  			air_date:    podcast.air_date.present? ? podcast.air_date.strftime('%m/%d/%Y')  : nil,
  			description: podcast.description,
  			recording:   podcast.recording.present? && podcast.recording.url.present? && podcast.recording.url.size > 0 ? podcast.recording.url : nil
  		} 
  	}

    data[:pagination] = Podcast.pagination_data Podcast.all.count, page_num, per_page

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
