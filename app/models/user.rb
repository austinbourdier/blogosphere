class User < ActiveRecord::Base
  has_many :posts

  validates :username, uniqueness: true

  def self.make_new_user(username, password)
    if User.create(username: username).valid?
      User.create(username: username, password: password, logged_in: false)
    else
      return false
    end
  end

  def self.set_logged_in_true(username)
    user = User.where('username = ?', username)
    user.logged_in = true
    save.user
  end

  def self.set_logged_in_false(username)
    user = User.where('username = ?', username)
    user.logged_in = false
    save.user
  end

  def self.get_password(username, password)
    user = User.where('username = ?', username)
    user.password == password
  end
end