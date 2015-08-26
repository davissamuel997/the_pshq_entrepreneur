class Image < ActiveRecord::Base

	belongs_to :imageable, :polymorphic => true

  has_attached_file :attachment, :storage => :s3, :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :attachment, :content_type => ['image/png', 'image/jpeg']

  def s3_credentials
  	config = YAML.load_file(Rails.root+"config/application.yml")[Rails.env]

    {:bucket => config["RECORDING_BUCKET"], :access_key_id => config["AMAZON_ACCESS_KEY"], :secret_access_key => config["AMAZON_SECRET_KEY"]}
  end

end
