class Router
  def initialize
    @controller = LpsController.new
    @running = true
  end

  def run
    print_welcome
    while @running
      print_menu
      action = gets.chomp.to_i
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.index
    when 2 then @controller.create
    when 3 then @controller.update
    when 4 then @controller.destroy
    when 5 then stop
    else
      puts "Please choose from 1 to 5"
    end
  end

  def stop
    puts "Bye, bye!"
    @running = false
  end

  def actions
    [
      "List all LPs",
      "Add a LP to your database",
      "Edit an existing LP",
      "Delete a LP",
      "Exit"
    ]
  end

  def print_menu
    puts "\n--\nWhat do you want to do?"
    actions.each_with_index do |action, index|
      puts "#{index + 1} - #{action}"
    end
    print "> "
  end

  def print_welcome
    puts "-----------------------------"
    puts "Welcome to your LPs Database!"
    print "-----------------------------"
  end
end
