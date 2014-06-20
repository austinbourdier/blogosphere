require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

# list = Controller.new
# list.run

posts = Post.list_posts
Page_creater.create_page(posts)