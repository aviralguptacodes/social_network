User.destroy_all
Group.destroy_all
Post.destroy_all
Like.destroy_all
Comment.destroy_all

user1 = User.create!(email: 'user1@example.com', password: 'Welcome@123', password_confirmation: 'Welcome@123')
user2 = User.create!(email: 'user2@example.com', password: 'Welcome@123', password_confirmation: 'Welcome@123')

puts "Created users: #{User.pluck(:email).join(', ')}"

group1 = Group.create!(name: 'Ruby Enthusiasts', description: 'A group for Ruby programming enthusiasts.')
group2 = Group.create!(name: 'Rails Developers', description: 'A group for developers working with Ruby on Rails.')

puts "Created groups: #{Group.pluck(:name).join(', ')}"

user1.groups << group1
user1.groups << group2
user2.groups << group2

puts "User1 groups: #{user1.groups.pluck(:name).join(', ')}"
puts "User2 groups: #{user2.groups.pluck(:name).join(', ')}"

post1 = Post.create!(user: user1, group: group1, content: 'Hello, Ruby Enthusiasts! Excited to be here.')
post2 = Post.create!(user: user1, group: group1, content: 'Has anyone tried the new Ruby 3.1? Thoughts?')

puts "Group1 posts: #{group1.posts.pluck(:content).join(', ')}"

post3 = Post.create!(user: user1, group: group2, content: 'Welcome to Rails Developers group!')
post4 = Post.create!(user: user2, group: group2, content: 'Any tips for optimizing Rails apps?')

puts "Group2 posts: #{group2.posts.pluck(:content).join(', ')}"

Like.create!(user: user2, post: post1)
Like.create!(user: user1, post: post4)

puts "Post1 likes count: #{post1.likes.count}"
puts "Post4 likes count: #{post4.likes.count}"

Comment.create!(user: user2, post: post1, content: 'Welcome! Glad to have you here.')
Comment.create!(user: user1, post: post4, content: 'Optimize code!')

puts "Post1 comments: #{post1.comments.pluck(:content).join(', ')}"
puts "Post4 comments: #{post4.comments.pluck(:content).join(', ')}"
