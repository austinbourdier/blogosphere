require_relative '../../config/application'

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
        if make_new_user(username,password)
          break
        else
        puts "The user name already exists, try again"
        end
      end
    puts "You are are signed up! Now log-in."
    logged_out_menu

    when "2" #log-in
      looping = true
      while looping do
        username = View.get_username
        password = View.get_password
        if User.check_password(username, password) ==  false
          puts "Invaid password or username, try again!"
        else
          @current_user = User.check_password(username, password)
          @current_user.set_logged_in_true
          puts "You are now logged in!"
          looping = false
          logged_in_menu
        end
      end

    when "3" #open page
      PageCreator.create_page
      logged_out_menu
    when "4" #exit
      return
    else
      puts "Please choose a number from the list."
      logged_out_menu
    end

  end

  def logged_in_menu
   response = View.logged_in_menu(@current_user.username)
    case response
    when "1" # post
      title = View.get_title
      content = View.get_post
      tag = View.get_tag
      Post.add_post(@current_user.id,title,content,tag)
      puts "Your post is added!"
      logged_in_menu
    when "2" #open page
      PageCreator.create_page
      logged_in_menu
    when "3" #log out
      puts "You are now logged out!"
      @current_user.set_logged_in_false
      logged_out_menu
    when "4" #exit
      return
    else
      puts "please choose a number from the list"
      logged_in_menu
    end
  end

  def make_new_user(username, password)
    if User.new(username: username, password: password).valid?
      @current_user = User.create(username: username, password: password, logged_in: false)
      return true
    else
      return false
    end
  end
end