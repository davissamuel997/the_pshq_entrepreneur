class Image < ActiveRecord::Base

	belongs_to :imageable, :polymorphic => true

  has_attached_file :attachment, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/

  def s3_credentials
    if Rails.env.production?
      result = {:bucket => ENV["RECORDING_BUCKET"], :access_key_id => ENV["AMAZON_ACCESS_KEY"], :secret_access_key => ENV["AMAZON_SECRET_KEY"]}
    else
  	  config = YAML.load_file(Rails.root+"config/application.yml")[Rails.env]
      result = {:bucket => config["RECORDING_BUCKET"], :access_key_id => config["AMAZON_ACCESS_KEY"], :secret_access_key => config["AMAZON_SECRET_KEY"]}
    end

    result
  end

end
