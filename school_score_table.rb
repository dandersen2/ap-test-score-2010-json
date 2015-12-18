class SchoolScoreTable
  attr_reader :school_scores

  def initialize(scores)
    @school_scores = populate_table(scores)
  end

  def populate_table(scores)
    scores.map {|score| SchoolScore.new(score)}
  end

end
