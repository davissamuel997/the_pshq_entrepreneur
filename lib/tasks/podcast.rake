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

end