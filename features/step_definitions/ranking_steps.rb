Given /I am on my user profile/ do
    user1 = User.new(:username => "tester",
                     :rank => 50,
                     :email => 'tester@test.com',
                     :password => 'testtesttest')
    user2 = User.new(:username => "test1",
                     :rank => 30,
                     :email => 'tester@test.com',
                     :password => 'testtesttest')
    user3 = User.new(:username => "test2",
                     :rank => 100,
                     :email => 'tester@test.com',
                     :password => 'testtesttest')
    user4 = User.new(:username => "test3",
                     :rank => 40,
                     :email => 'tester@test.com',
                     :password => 'testtesttest')
    user5 = User.new(:username => "test4",
                     :rank => 60,
                     :email => 'tester@test.com',
                     :password => 'testtesttest')
    follower1 = Followers.new(:user => "test1",
                             :follows => "tester")
    follower2 = Followers.new(:user => "test2",
                             :follows => "tester")
    follower3 = Followers.new(:user => "test3",
                             :follows => "tester")
    user1.save
    user2.save
    user3.save
    user4.save
    user5.save
    follower1.save
    follower2.save
    follower3.save

    visit('/login')
    fill_in('Email', :with=>'tester@test.com')
    fill_in('Password', :with=>'testtesttest')
    click_button('Sign In')

    uri = URI.parse(current_url)
    "#{uri.path}?#{uri.query}".should == '/users/1?'
end

When /I click on the ranking button/ do
    click_link("Update Info")
    click_link("Rankings")
end

Then /I should see a list of my followers ranked by (.*)/ do |order|
    page.should have_content("tester -- ")
end

When /I click on my ranking/ do
end

Then /I should see a user with a higher ranking on (.*)/ do |sort|
end

When /I click on my visualization/ do
end

Then /I should see my influence as a graph/ do
end
