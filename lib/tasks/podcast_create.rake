namespace :podcast_create do

  desc "creates episode 1"
  task :episode_1 => :environment do
    file = 'tmp/podcasts/episode-1.mp3'

    p = Podcast.new(name: "The Entrepreneur - Hosted By Jake Davis of Problem Solution HQ", air_date: '1-7-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 2 - Adrie Groeneweg"
  task :episode_2 => :environment do
    file = 'tmp/podcasts/episode-2.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Adrie Groeneweg – The Founder of Pizza Ranch", air_date: '20-7-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 3 - Laurie Hurley"
  task :episode_3 => :environment do
    file = 'tmp/podcasts/episode-3.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Laurie Hurley for ProblemSolutionHQ", air_date: '21-7-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 4 - Lori Axler"
  task :episode_4 => :environment do
    file = 'tmp/podcasts/episode-4.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Lori Axler for ProblemSolutionHQ", air_date: '22-7-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 5 - Tyler Feller"
  task :episode_5 => :environment do
    file = 'tmp/podcasts/episode-5.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Tyler Feller for ProblemSolutionHQ", air_date: '23-7-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 6 - Sherry Wood"
  task :episode_6 => :environment do
    file = 'tmp/podcasts/episode-6.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Sherry Wood for ProblemSolutionHQ", air_date: '23-7-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 7 - Mike Middendorp"
  task :episode_7 => :environment do
    file = 'tmp/podcasts/episode-7.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Mike Middendorp, Owner of 2 Pizza Ranch Stores", air_date: '6-8-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 8 - Samuel Davis"
  task :episode_8 => :environment do
    file = 'tmp/podcasts/episode-8.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Samuel Davis of ProblemSolutionHQ", air_date: '7-8-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 9 - Peter Sperry"
  task :episode_9 => :environment do
    file = 'tmp/podcasts/episode-9.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Peter Sperry of Redpoint Rack and PSHQ", air_date: '12-8-2015'.to_date)

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

end