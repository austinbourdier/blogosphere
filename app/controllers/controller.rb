require_relative '../models/post'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../view/view'



class Controller
  def run
    logged_out_menu
  end

  def logged_out_menu
    response = View.logged_out_menu

    case response
    when "1" #register
      loop do
        username = View.get_username
        password = View.get_password
        if User.make_new_user(username,password)
          break
        else
        puts "The user name already exists, try again"
        end
      end
    puts "You are are signed up! Now log-in."
    logged_out_menu

    when "2" #log-in
      loop do
        username = View.get_username
        password = View.get_password
        if User.check_password(username,password) ==  false
          puts "Invaid password for username, try again!"
        end
        break if User.check_password(username,password)
      end
      User.set_logged_in_true(username)
      puts "You are now logged in!"
      logged_in_menu(username)

    when "3" #open page
      exec 'ruby ../view/ruby_to_html.rb'
      logged_out_menu
    when "4" #exit
      return
    else
      puts "Please choose a number from the list."
      logged_out_menu
    end

  end

  def logged_in_menu(username)
   response = View.logged_in_menu
    case response
    when "1" # post
      title = View.get_title
      content = View.get_post
      tag = View.get_tag
      Post.add_post(username,title,content,tag)
      puts "Your post is added!"
      logged_in_menu(username)
    when "2" #open page
      exec 'ruby ../view/ruby_to_html.rb'
      logged_in_menu(username)
    when "3" #log out
      puts "You are now logged out!"
      User.set_loggen_in_false(username)
      logged_out_menu
    when "4" #exit
      return
    else
      puts "please choose a number from the list"
      logged_in_menu(username)
    end
  end
end