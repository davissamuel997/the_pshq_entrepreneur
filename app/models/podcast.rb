class Podcast < ActiveRecord::Base

  has_attached_file :recording, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :recording, :content_type => ['audio/mpeg']

  def s3_credentials
  	config = YAML.load_file(Rails.root+"config/application.yml")[Rails.env]

    {:bucket => config["RECORDING_BUCKET"], :access_key_id => config["AMAZON_ACCESS_KEY"], :secret_access_key => config["AMAZON_SECRET_KEY"]}
  end

end
