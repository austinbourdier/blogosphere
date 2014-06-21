require_relative '../models/post'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../view/view'
class Controller
  def initialize
    logged_out_menu
  end

  def logged_out_menu
    response = View.logged_out_menu
    case response
    when "1" #register
      loop do
        break if User.make_new_user(View.get_username, View.get_password)
        puts "That username already exists, try again"
      end
      puts "You have signed up!"
    when "2" #log-in
      loop do
        if User.check_password(username = View.get_username, password = View.get_password)
          User.set_logged_in_true(username)
          puts "You are now logged in!"
          logged_in_menu(username)
          break
        end
        puts "Invalid password or username, try again!"
      end
    when "3" #open page
      PageCreator.new
    when "4" #filter
      PageCreator.new(Tag.filter_for_tag(View.get_tag))
    when "5" #exit
      exit!
    else
      puts "Please choose a number from the list:"
    end
    logged_out_menu
  end

  def logged_in_menu(username)
   response = View.logged_in_menu(username)
    case response
    when "1" # post
      Post.add_post(username,View.get_title, View.get_post, View.get_tag)
      puts "Your post has been added!"
    when "2" #open page
      PageCreator.new
    when "3" #filter
      PageCreator.new(Tag.filter_for_tag(View.get_tag))
    when "4" #log out
      puts "You are now logged out!"
      User.set_logged_in_false(username)
      logged_out_menu
    when "5" #exit
      exit!
    else
      puts "Please choose a number from the list:"
    end
    logged_in_menu(username)
  end
end