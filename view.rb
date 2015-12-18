class View
  def display(output)
    puts output
  end

  def get_input
    gets.chomp
  end

  def display_welcome_message
    display("Welcome to the NYC PS AP Results for 2010")
    display("Here are a list of commands you may use:")
    display("Enter in a keyword in the HS name and you will get a list of schools that match that keyword and their # of AP test takers, total exams taken, and the # of exams with >= 3 scores. If your keyword doesn't work, try another one.")
  end
end
