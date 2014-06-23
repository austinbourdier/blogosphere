require_relative '../../config/application'

class PageCreator
  def initialize (posts = Post.list_posts)
    @posts = posts
    create_page
  end
  def create_page
    file = File.new("blog.html", "w+")
    file.puts "<!DOCTYPE><HTML><head>
    <style type = 'text/css'>
      body {
        background-color: orange;
      }
      .posts {
        background-color: yellow;
        margin, padding: 0;
        top: 0;
        border: black solid 2px;
      }
    </style>
    </head><BODY><CENTER><h1>Blogosphere</h1></CENTER>"
    @posts.each do |post|
      file.print "<div class = 'posts'><h3>#{post[0]}. #{post[1]}</h3><h4>#{post[2]} points</h4><p>#{post[3]}</p><p>Tags: "
      post[4].each do |tag|
        file.print "#{tag} "
      end
      file.puts "</div>"
    end
    file.puts "</BODY></HTML>"
    file.close()
    system "open blog.html"
    return
  end
end

