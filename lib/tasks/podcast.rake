namespace :podcast do

  desc "deletes all podcasts from db"
  task :destroy_all => :environment do

    podcasts = Podcast.all

    if podcasts.present? && podcasts.count > 0
      podcasts.each do |podcast|
        podcast.destroy

        puts "podcast destroyed"
      end
    end

  end

  desc "inputs image to all podcasts"
  task :image_all => :environment do
    
    podcasts = Podcast.all

    if podcasts.present? && podcasts.count > 0
      image_file = 'tmp/images/PSHQ-Entrepreneur-Cover-Show-small.jpg'

      podcasts.each do |podcast|

        image = podcast.images.new(user_id: User.first.id, name: 'ThePSHQEntrepreneur')

        File.open(image_file) do |f|
          image.attachment = f

          puts 'saving image..'
          image.save

          puts 'image saved'
        end

      end
    end

  end

end