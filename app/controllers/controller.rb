require_relative '../models/post'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../view/view'



class Controller
  def self.run
    if self.logged_in
      response = View.logged_in_menu
    else
      response = View.logged_out_menu
    end

    case response
    when "Register"
    loop do
      username = View.get_username
      password = View.get_password

      User.make_new_user(username,password)






    when "Log-in"

    when "Open the page"

    when "Log-out"

    when "Exit"

  end

end

