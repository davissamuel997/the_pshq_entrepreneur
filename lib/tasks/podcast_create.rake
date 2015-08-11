namespace :podcast_create do

  desc "creates episode 1"
  task :episode_1 => :environment do
    file = 'tmp/podcasts/episode-1.mp3'

    p = Podcast.new(name: "The Entrepreneur - Hosted By Jake Davis of Problem Solution HQ", air_date: '1-7-2015'.to_date)

    File.open(file) do |f|
      p.recording = f
      p.save
    end
  end

  desc "creates episode 2"
  task :episode_2 => :environment do
    file = 'tmp/podcasts/episode-2.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Adrie Groeneweg – The Founder of Pizza Ranch")

    File.open(file) do |f|
      p.recording = f
      p.save
    end
  end

  desc "creates episode 3"
  task :episode_3 => :environment do
    file = 'tmp/podcasts/episode-3.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Laurie Hurley for ProblemSolutionHQ")

    File.open(file) do |f|
      p.recording = f

      p 'saving podcast..'
      p.save

      p 'podcast saved'
    end
  end

  desc "creates episode 4"
  task :episode_4 => :environment do
    file = 'tmp/podcasts/episode-4.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Lori Axler for ProblemSolutionHQ")

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 5"
  task :episode_5 => :environment do
    file = 'tmp/podcasts/episode-5.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Tyler Feller for ProblemSolutionHQ")

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 6"
  task :episode_6 => :environment do
    file = 'tmp/podcasts/episode-6.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Sherry Wood for ProblemSolutionHQ")

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 7"
  task :episode_7 => :environment do
    file = 'tmp/podcasts/episode-7.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Mike Middendorp, Owner of 2 Pizza Ranch Stores")

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

  desc "creates episode 8"
  task :episode_8 => :environment do
    file = 'tmp/podcasts/episode-8.mp3'

    p = Podcast.new(name: "The PSHQ Entrepreneur Interviews Samuel Davis of ProblemSolutionHQ")

    File.open(file) do |f|
      p.recording = f

      puts 'saving podcast..'
      p.save

      puts 'podcast saved'
    end
  end

end