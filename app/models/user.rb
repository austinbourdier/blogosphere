class User < ActiveRecord::Base
  has_many :posts

  validates :username, uniqueness: true

  def self.make_new_user(username, password)
    User.create(username: username, password: password, logged_in: false).valid?
  end

  def self.set_logged_in_true(username)
    user = User.find_by(username: username)
    user.logged_in = true
  end

  def self.set_logged_in_false(username)
    user = User.find_by(username: username)
    user.logged_in = false
  end

  def self.check_password(username, password)
    user = User.find_by(username: username)
    if user == nil
      return false
    elsif user.password == password
      return true
    else
      return false
    end
  end
end