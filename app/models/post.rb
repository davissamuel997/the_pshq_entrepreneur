class Post < ActiveRecord::Base

  has_many :comments, as: :commentable

  def self.get_posts(options = {})
  	data = {:errors => false}

  	p 'in the model'

  	data
  end
	
end
