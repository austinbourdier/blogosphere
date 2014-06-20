require_relative '../../config/application'
class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags

  def self.list_posts
    posts = []


    Post.all.each do |post|
      data = []
      tags = []
      data[0] = post.title
      data[1] = post.content
      tag_objects = Tag.joins(:post).where("posts.id = ?", post.id)
      tag_objects.each{|tag| tags << tag.tag}
      data[2] = tags
      posts << data
    end
   posts
  end

  def self.add_post(title,content,*tags)
    post = Post.create(title: title, content: content)
    tags.each do |tag|
      post.tags << Tag.new(tag: tag)
    end
  end

end
