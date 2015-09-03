ActiveRecord::Base.connection.execute("TRUNCATE TABLE comments;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE images;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE podcasts;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE posts;")
ActiveRecord::Base.connection.execute("TRUNCATE TABLE users;")

user1 = User.where(:first_name => 'Samuel', :last_name => 'Davis', :email => 'samuel@problemsolutionhq.com').first_or_create(:password => 'password', :password_confirmation => 'password')
user2 = User.where(:first_name => 'Peter', :last_name => 'Sperry', :email => 'peter@problemsolutionhq.com').first_or_create(:password => 'password', :password_confirmation => 'password')

Podcast.where(name: 'The Entrepreneur - Hosted By Jake Davis of Problem Solution HQ', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/016/original/episode-1.mp3?1439822262', air_date: Date.parse('2015-07-01 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'The PSHQ Entrepreneur Interviews Adrie Groeneweg – The Founder of Pizza Ranch', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/017/original/episode-2.mp3?1439822295', air_date: Date.parse('2015-07-20 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'The PSHQ Entrepreneur Interviews Laurie Hurley for ProblemSolutionHQ', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/018/original/episode-3.mp3?1439822343', air_date: Date.parse('2015-07-21 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'The PSHQ Entrepreneur Interviews Lori Axler for ProblemSolutionHQ', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/019/original/episode-4.mp3?1439822384', air_date: Date.parse('2015-07-22 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'The PSHQ Entrepreneur Interviews Tyler Feller for ProblemSolutionHQ', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/020/original/episode-5.mp3?1439822430', air_date: Date.parse('2015-07-23 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'The PSHQ Entrepreneur Interviews Sherry Wood for ProblemSolutionHQ', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/021/original/episode-6.mp3?1439822487', air_date: Date.parse('2015-07-23 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'The PSHQ Entrepreneur Interviews Mike Middendorp, Owner of 2 Pizza Ranch Stores', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/022/original/episode-7.mp3?1439822515', air_date: Date.parse('2015-08-06 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'The PSHQ Entrepreneur Interviews Samuel Davis of ProblemSolutionHQ', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/023/original/episode-8.mp3?1439822567', air_date: Date.parse('2015-08-07 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
Podcast.where(name: 'Peter Sperry of Redpoint Rack and PSHQ', recording: 'http://s3.amazonaws.com/pshq_entrepreneur_recordings/podcasts/recordings/000/000/024/original/episode-9.mp3?1439822613', air_date: Date.parse('2015-08-12 00:00:00 UTC').strftime('%Y-%m-%d')).first_or_create
