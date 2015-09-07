class Post < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :images, as: :imageable

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
  			summary:     post.summary,
  			user:        post.user_id.present? && post.user_id.to_i > 0 ? User.find(post.user_id) : nil
  		}
  	}
  	
    data[:pagination] = Podcast.pagination_data Post.all.count, page_num, per_page

  	data
  end

  def self.find_post(options = {})
  	data = {:errors => false}

  	if options[:post_id].present? && options[:post_id].to_i > 0
  		post = Post.find(options[:post_id])

  		data[:post] = {
  			post_id:     post.id,
  			user:        post.user_id.present? && post.user_id.to_i > 0 ? User.find(post.user_id) : nil,
  			name:        post.name,
  			post_date:   post.post_date.present? ? post.post_date.strftime('%m/%d/%Y') : nil,
  			description: post.description,
  			summary:     post.summary,
  			comments:    post.comments.order('post_date ASC').map{ |comment| {
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

  def self.update_post(options = {})
  	data = {:errors => false}

  	if options[:post_id].present? && options[:post_id].to_i > 0 && options[:post_params].present?
  		post = Post.find(options[:post_id])

      post_params = options[:post_params]

      unless post.update(description: options[:description], user_id: options[:user_id],
                         post_date:   Time.now, name: post_params["name"],
                         summary:     post_params["summary"], post_date: post_params["post_date"])

        data[:errors] = true
      end
  	else
  		data[:errors] = true
  	end

  	data
  end

  def self.create_post_comment(options = {})
    data = {:errors => false}

    if options[:post_id].present? && options[:post_id].to_i > 0 && options[:comment_description].present? && options[:comment_description].length > 0 && options[:user_id].present? && options[:user_id].to_i > 0
      post = Post.find(options[:post_id])

      # Will have to refactor to take into account "approved"
      comment = post.comments.new(user_id: options[:user_id], post_date: Time.now,
                                  description: options[:comment_description], approved: true)

      if comment.save
        data[:comments] = post.comments.order('post_date ASC').map{ |comment| {
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

  def self.create_post(options = {})
    data = {:errors => false}

    if options[:post_params].present? && options[:user_id].present? && options[:user_id].to_i > 0
      post_params = options[:post_params]

      post = Post.new(description: options[:description], user_id: options[:user_id],
                      post_date:   Time.now, name: post_params["name"],
                      summary:     post_params["summary"])

      p options[:post_image]
      p 'check it out here'

      if options[:post_image].present? && File.file?(options[:post_image])
        p 'hello world'
      end

      if post.save
        data[:post] = {
          post_id:     post.id,
          name:        post.name,
          post_date:   post.post_date.present? ? post.post_date.strftime('%m/%d/%Y') : nil,
          description: post.description,
          summary:     post.summary,
          user:        post.user_id.present? && post.user_id.to_i > 0 ? User.find(post.user_id) : nil
        }
      else
        data[:errors] = true
      end
    else
      data[:errors] = true
    end

    data
  end
	
end
