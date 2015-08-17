
user1 = User.where(:first_name => 'Samuel', :last_name => 'Davis', :email => 'samuel@problemsolutionhq.com').first_or_create(:password => 'password', :password_confirmation => 'password')
user2 = User.where(:first_name => 'Peter', :last_name => 'Sperry', :email => 'peter@problemsolutionhq.com').first_or_create(:password => 'password', :password_confirmation => 'password')
