namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_items

    #make_relationships
  end
end

def make_items

  99.times do |n|
    name  = Faker::Name.name
    description = "description #{n+1}"
    image = File.open('/app/assets/images/rails.png')
    Item.create!(name:        name,
                 description: description,
                 avatar:      image
                )
  end
end



#def make_relationships
 # users = User.all
  #user  = users.first
  #ollowed_users = users[2..50]
  #followers      = users[3..40]
  #followed_users.each { |followed| user.follow!(followed) }
  #followers.each      { |follower| follower.follow!(user) }
#end