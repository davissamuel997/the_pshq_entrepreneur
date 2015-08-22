class Post < ActiveRecord::Base

  has_many :comments, as: :commentable

  def self.get_posts(options = {})
  	data = {:errors => false}

    page_num = (options[:page] || 1).to_i
    per_page = 12

    posts = Post.all.page(page_num).per(per_page).order('created_at DESC')

  	data[:posts] = posts.map { |post| {
  			post_id:     post.id,
  			name:        post.name,
  			post_date:   post.post_date.present? ? post.post_date.strftime('%m/%d/%Y') : nil,
  			description: post.description,
  			user:        post.user_id.present? && post.user_id.to_i > 0 ? User.find(post.user_id) : nil
  		}
  	}

    data[:pagination] = Podcast.pagination_data Post.all.count, page_num, per_page

  	data
  end
	
end
