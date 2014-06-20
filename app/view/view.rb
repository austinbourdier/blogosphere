class View
  # def initialize logged_in=false
  #   @logged_in = logged_in #maybe an activerecord query here?
  # end
  def self.logged_out_menu
    p "Welcome to the Blogosphere, please select a number:"
    p "1 Register"
    p "2 Log-in"
    p "3 Open page"
    p "4 Exit"
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
  def self.get_title
    p "Enter title for post:"
    gets.chomp
  end
  def self.get_post
    p "Enter text to post:"
    gets.chomp
  end
  def self.get_tags
    p "Enter tags for post:"
    gets.chomp
  end
  def self.filter_for_tag
    p "Enter a tag to search for:"
    gets.chomp
  end
end

