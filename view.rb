class View
  def display(output)
    puts output
  end

  def get_input
    gets.chomp
  end

  def display_welcome_message
    draw_xmas_tree
    display("Welcome to the NYC PS AP Results for 2010")
    display("Here are a list of commands you may use:")
    display("Enter in a keyword in the HS name and you will get a list of schools that match that keyword and their # of AP test takers, total exams taken, and the # of exams with >= 3 scores. If your keyword doesn't work, try another one.")
  end

  def display_school_info(school)
    display("This is the High School: #{school.schoolname}")
    display("AP test takers: #{school.ap_test_takers}")
    display("Total exams taken: #{school.total_exams_taken}")
    display("Number of exams with a score of 3, 4 or 5: #{school.number_of_exams_with_scores_3_4_or_5}")
  end

  def draw_xmas_tree
    display("      $\n     / \\\n    / * \\\n   / *~* \\\n  / *~*~* \\\n / *~*~*~* \\\n    |||||")
  end

  def draw_face
    face = [" __.-._",
            " '-._\"7'",
            " /'.-c",
            " |  /T",
            "_)_/LI"]
    display(face.join("\n"))
  end

end
