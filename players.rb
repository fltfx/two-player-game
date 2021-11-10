class Players
  attr_accessor :name, :id, :score

  def initialize(n, i) #new initialize
    @name = n
    @id = i
    @score = 3
    confirmation
  end

  def confirmation
    puts "#{self.name} is player #{@id}"
  end

  #update score
  def updateScore #'id' of loser!!!
    @score -= 1
  end

  #outputting score
  def outputPlayerScore
    return @score
  end

end


