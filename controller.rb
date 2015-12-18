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
      # reader = JSON.parse(open(url).read)
      # score_data = SchoolScoreTable.new(reader)
      # binding.pry
      if true
        # binding.pry
        matched = JSON.parse(open(url+'?$q=' +input).read)
        binding.pry
        usable_scores = SchoolScore.new(matched[0])
        view.display(usable_scores.ap_test_takers_)
        view.display(usable_scores.total_exams_taken)
        view.display(usable_scores.number_of_exams_with_scores_3_4_or_5)
      else
        view.display("Sorry, I don't know that command.") unless input == "exit"
      end
    end
    view.display("End")
  end
end

Controller.new
