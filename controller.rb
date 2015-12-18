require 'pry'
require 'json'
require 'open-uri'
require_relative 'view'
require_relative 'school_score'
require_relative 'school_score_table'

class Controller
  attr_reader :view, :url, :score_data

  def initialize
    @view = View.new
    @score_data = []
    @url = 'https://data.cityofnewyork.us/resource/sg2c-qbjf.json'
    run_interface
  end

  def run_interface
    input = ""
    view.display_welcome_message
    until input == "exit"
      input = view.get_input
      command = input.split.shift
      user_input = input.split[1..-1].join(' ')
      # binding.pry
      case command
      when 'Search'
        matched = JSON.parse(open(url+'?$q='+user_input).read)
        if matched.empty?
          view.display('Please enter a valid school name to search')
        else
          usable_scores = SchoolScore.new(matched[0])
          view.display('This is the High School: ' + usable_scores.schoolname)
          view.display('AP test takers: ' + usable_scores.ap_test_takers)
          view.display('Total exams taken: ' + usable_scores.total_exams_taken)
          view.display('Number of exams with a score of 3, 4 or 5: ' + usable_scores.number_of_exams_with_scores_3_4_or_5)
        end
      else
        view.display("Sorry, I don't know that command.") unless input == "exit"
      end
    end
    view.display("End")
  end
end

Controller.new
