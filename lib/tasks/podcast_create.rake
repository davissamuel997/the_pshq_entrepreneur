task :podcast_create_all => :environment do

  file = 'tmp/podcasts/episode-1.mp3'

  p = Podcast.new(episode_number: 1, name: 'The Entrepreneur - Hosted By Jake Davis of Problem Solution HQ', air_date: Date.parse('2015-07-01 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-2.mp3'

  p = Podcast.new(episode_number: 2, name: 'The PSHQ Entrepreneur Interviews Adrie Groeneweg – The Founder of Pizza Ranch', air_date: Date.parse('2015-07-20 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-3.mp3'

  p = Podcast.new(episode_number: 3, name: 'The PSHQ Entrepreneur Interviews Laurie Hurley for ProblemSolutionHQ', air_date: Date.parse('2015-07-21 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-4.mp3'

  p = Podcast.new(episode_number: 4, name: 'The PSHQ Entrepreneur Interviews Lori Axler for ProblemSolutionHQ', air_date: Date.parse('2015-07-22 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-5.mp3'

  p = Podcast.new(episode_number: 5, name: 'The PSHQ Entrepreneur Interviews Tyler Feller for ProblemSolutionHQ', air_date: Date.parse('2015-07-23 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-6.mp3'

  p = Podcast.new(episode_number: 6, name: 'The PSHQ Entrepreneur Interviews Sherry Wood for ProblemSolutionHQ', air_date: Date.parse('2015-07-23 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-7.mp3'

  p = Podcast.new(episode_number: 7, name: 'The PSHQ Entrepreneur Interviews Mike Middendorp, Owner of 2 Pizza Ranch Stores', air_date: Date.parse('2015-08-06 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-8.mp3'

  p = Podcast.new(episode_number: 8, name: 'The PSHQ Entrepreneur Interviews Samuel Davis of ProblemSolutionHQ', air_date: Date.parse('2015-08-07 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

  file = 'tmp/podcasts/episode-9.mp3'

  p = Podcast.new(episode_number: 9, name: 'Peter Sperry of Redpoint Rack and PSHQ', air_date: Date.parse('2015-08-12 00:00:00 UTC').strftime('%Y-%m-%d'))

  File.open(file) do |f|
    p.recording = f

    puts 'saving podcast..'
    p.save

    puts 'podcast saved'
  end

end