require_relative '../../config/application'

class PageCreator
  def self.create_page
    file = File.new("blog.html", "w+")
    file.puts "<!DOCTYPE><HTML><head><link rel='stylesheet' type = 'text/css' href = 'blog.css'/></head><BODY><CENTER><h1>Blogosphere</h1></CENTER>"
    posts = self.list_posts
    posts.each do |post|
      file.print "<div><h3>#{post[0]}</h3><p>#{post[1]}</p><p>Tags: "
      post[2].each do |tag|
        file.print "#{tag} "
      end
      file.print "</p><div class = 'hide'>Hide"
      file.puts "</div>"

    end
    file.puts "</BODY></HTML>"
    file.close()
    system "open blog.html"
    return
  end

  def self.list_posts
    posts = Post.order('updated_at DESC')
    posts.map do |post|
      [post.title, post.content, post.tags.pluck(:tag)]
    end
  end
end

