# require_relative 'blog.html'
def page_creater (posts)
  file = File.new("blog.html", "w+")
  file.puts "<!DOCTYPE><HTML><head><link rel='stylesheet' type = 'text/css' href = 'blog.css'/></head><BODY>"
  file.puts ""
  file.puts "<CENTER><h1>Blogosphere</h1></CENTER>"
  posts.each do |post|
    file.puts "<div>#{post}</div>"
  end
  file.puts "</BODY></HTML>"
  file.close()
end

posts = ["post 1", "post 2", "post 3"]
page_creater(posts)