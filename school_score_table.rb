class SchoolScoreTable
  def initialize(scores)
    @school_scores = populate_table(scores)
  end

  def populate_table(scores)
    scores.map do |score|
      SchoolScore.new
    end
  end

end


