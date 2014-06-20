class View
  # def initialize logged_in=false
  #   @logged_in = logged_in #maybe an activerecord query here?
  # end
  def self.logged_out_menu
    p "Welcome to the Blogosphere, please select an option:"
    p "Register"
    p "Log-in"
    p "Open page"
    p "Exit"
    gets.chomp
  end
  def self.logged_in_menu
    p "Welcome back USER_NAME, please select an option:"
    p "Post"
    p "Open the page"
    p "Log-out"
    p "Exit"
    gets.chomp
  end
  def self.get_username
    p "Please enter a Username:"
    get.chomp
  end
  def self.get_password
    p "Please enter a Password:"
    get.chomp
  end
  def self.get_post
    p "Enter text to post:"
  end
  def self.get_tags
    p "Enter tags for post:"
  end
  def self.filter_for_tag
    p "Enter a tag to search for:"
    gets.chomp
  end
end

