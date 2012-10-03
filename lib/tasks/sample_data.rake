namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
     make_users
     make_scopes
     make_moderators
     make_members
    
  end
end

def make_users
    admin = User.create!(name: "Christian Agupitan",
                         email: "cd.agupitan@gmail.com",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      phone = "9319593"
      User.create!(name: name,
                   email: email,
                   phone: phone,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
end

def make_scopes
  Scope.create!(name: "Econ 101")
  Scope.create!(name: "Mgmt 101")
  Scope.create!(name: "Stat 101")
  Scope.create!(name: "CS 101")
  
end

def make_moderators
  2.times do |n|
    user = User.find( n+1 )
    Moderator.create!(user_id: n+1, scope_id: n+1)
  end
end

def make_members
  10.times do |n|
    Member.create!(user_id: n+1, scope_id: 1)
  end
  
  10.times do |n|
    Member.create!(user_id: n+11, scope_id: 2)
  end
  
  10.times do |n|
    Member.create!(user_id: n+6, scope_id: 3)
  end
end