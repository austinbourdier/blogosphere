class Controller
  def run
    input = ARGV
    command = input.shift
    argument = input.join(" ")
    case command
    when "add"
      Task.add(argument)
    when "delete"
      Task.delete(argument)
    when "complete"
      Task.complete(argument)
    when "list"
      Task.list
    else
      View.help_user
    end
  end

end

class View
  def self.help_user
    puts "use add, delete, complete or list"
  end

  def self.show_list (tasks)
    tasks.each do |task|
      puts "#{task.id}. #{task.name} is #{task.finished ? 'completed' : 'not completed'}"
    end
  end

  def self.confirm_add
    puts "you've added #{Task.last.name} to your list."
  end

  def self.confirm_delete(task_name)
    puts "You've deleted #{task_name}"
  end

  def self.confirm_completed(task_name)
    puts "You've marked #{task_name} as completed"
  end

end

