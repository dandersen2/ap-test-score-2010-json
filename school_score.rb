class SchoolScore
  attr_reader :dbn, :schoolname, :ap_test_takers, :total_exams_taken, :number_of_exams_with_scores_3_4_or_5

  def initialize(args = {})
    @dbn = args.fetch('dbn', 000000)
    @schoolname = args.fetch('schoolname', "No Name")
    @ap_test_takers = args.fetch('ap_test_takers_', 0)
    @total_exams_taken = args.fetch('total_exams_taken', 0)
    @number_of_exams_with_scores_3_4_or_5 = args.fetch('number_of_exams_with_scores_3_4_or_5', 0)
  end

end
