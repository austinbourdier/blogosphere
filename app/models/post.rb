require_relative '../../config/application'
class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags

  def self.list_posts
    Post.order(point_count: :desc).all.map do |post|
      [post.id, post.title, post.point_count, post.content, post.tags.pluck(:tag)]
    end
  end

  def self.add_post(username, title, content, *tags)
    user_id = User.where("username = ?", username).pluck(:id)[0]
    post = Post.create(title: title, content: content, point_count: 0, user_id: user_id)
    tags.each do |tag|
      post.tags << Tag.new(tag: tag)
    end
  end

  def self.upvote_post(post_id)
    post = Post.find(post_id)
    post.point_count += 1
    post.save
  end

  def self.downvote_post(post_id)
    post = Post.find(post_id)
    post.point_count -= 1
    post.save
  end

end
