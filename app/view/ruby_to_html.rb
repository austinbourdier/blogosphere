require_relative '../../config/application'

class Page_creater
  def self.create_page (posts)
    file = File.new("blog.html", "w+")
    file.puts "<!DOCTYPE><HTML><head><link rel='stylesheet' type = 'text/css' href = 'blog.css'/></head><BODY><CENTER><h1>Blogosphere</h1></CENTER>"
    posts.each do |post|
      file.print "<div><h3>#{post[0]}</h3><p>#{post[1]}</p><p>Tags: "
      post[2].each do |tag|
        file.print "#{tag}"
      end
      file.print "</p><div class = 'hide'>Hide"
      file.puts "</div>"

    end
    file.puts "</BODY></HTML>"
    file.close()
    exec "open blog.html"
  end
end
# posts = [["Fido", "I lost my cat! But of course I found him hiding under my bed chewing on my socks again, what a silly boy!", ["funny, dog, silly"]], ["Friday night", "Wow last night was crazy, the Radmirals sure know how to have a fun time!", ["party, friends, yolo, nofilter"]], ["What are your weekend plans?", "Hey guys! We should all get together one of these weekends, I miss you all so much :(", ["sad, frown"]]]
# posts = Post.list_posts
# Page_creater.create_page(posts)
