class View
  # def initialize logged_in=false
  #   @logged_in = logged_in #maybe an activerecord query here?
  # end
  def self.logged_out_menu
    p "Welcome to the Blogosphere, please select a number:"
    p "1 Register"
    p "2 Log-in"
    p "3 Open page"
    p "4 Filter for a specific tag"
    p "5 Exit"
    print "> "
    gets.chomp
  end
  def self.logged_in_menu(username)
    p "Welcome back #{username}, please select an option:"
    p "1 Post"
    p "2 Vote on post"
    p "3 Open the page"
    p "4 Filter for a specific tag"
    p "5 Log-out"
    p "6 Exit"
    print "> "
    gets.chomp
  end
  def self.get_username
    print "Please enter a Username: "
    gets.chomp
  end
  def self.get_password
    print "Please enter a Password: "
    gets.chomp
  end
  def self.get_title
    print "Enter title for post: "
    gets.chomp
  end
  def self.voting
    p "Please select an option below:"
    p "1 Upvote a post"
    p "2 Downvote a post"
    gets.chomp
  end  
  def self.get_id
    p "Please enter a post ID number to vote on:"
    gets.chomp.to_i
  end
  def self.get_post
    print "Enter text to post: "
    gets.chomp
  end
  def self.get_tag
    print "Enter tags for post: "
    gets.chomp
  end
  def self.filter_for_tag
    print "Enter a tag to search for: "
    gets.chomp
  end
end

