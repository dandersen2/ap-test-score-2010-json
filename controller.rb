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
      case command
        when 'Search'
          handle_search(user_input)
        when 'Top_test_takers'
          handle_top_records(user_input)
        when ''
        else
          view.display("Sorry, I don't know that command.") unless input == "exit"
      end
    end
    view.display("End")
  end

  def handle_search(user_input)
    matched = JSON.parse(open(url+'?$q='+user_input).read)
    if matched.empty?
      view.display('Please enter a valid school name to search')
    else
      show_results(matched)
    end
  end

  def handle_top_records(user_input)
    matched = JSON.parse(open("#{url}?$order=ap_test_takers_%20DESC&$where=ap_test_takers_%20IS%20NOT%20NULL&$limit=1").read)
    show_results(matched)
  end

  private

  def show_results(matched)
    usable_scores = SchoolScore.new(matched[0])
    view.display_school_info(usable_scores)
  end

end

Controller.new
