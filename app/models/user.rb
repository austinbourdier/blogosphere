class User < ActiveRecord::Base
  has_many :posts

  validates :username, uniqueness: true
  validates :password, :length => { :minimum => 5 }

  

  def set_logged_in_true
    # user = User.find_by(username: username)
    self.logged_in = true
    self.save
  end

  def set_logged_in_false
    # user = User.find_by(username: username)
    self.logged_in = false
    self.save
  end

  def self.check_password(username, password)
    user = User.find_by(username: username)
    if user == nil
      return false
    elsif user.password == password
      return user
    else
      return false
    end
  end
end