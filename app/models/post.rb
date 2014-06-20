require_relative '../../config/application'
class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags

  def self.list_posts
    Post.all.map do |post|
      [post.title, post.content, post.tags.pluck(:tag)]
    end
  end

  def self.add_post(username, title, content, *tags)
    post = Post.create(title: title, content: content)
    user = User.
    tags.each do |tag|
      post.tags << Tag.new(tag: tag)
    end
  end

end
