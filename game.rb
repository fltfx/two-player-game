require './players'

class Game
  attr_accessor :answer, :currentPlayer
  #question method
  def createQuestion
    #initialize the two numbers for the question
    num1 = rand(1..20) 
    num2 = rand(1..20)
    @answer = num1 + num2
    puts "Player #{currentPlayer}: What does #{num1} plus #{num2} equal?"
    input = gets.chomp
    inputAndCheckAnswer(input, @p1, @p2)
  end

  #set currentPlayer
  def initialize(p1, p2) #new initialize
    @currentPlayer = 1
    @p1 = p1
    @p2 = p2
    #createQuestion
    loopQuestions
  end

  def loopQuestions
    check = true
    while (check)
      createQuestion
      if @p1.score == 0
        check = false
        putsWinnerMsg(@p2)
      elsif @p2.score == 0
        check = false
        putsWinnerMsg(@p1)
      else
        puts "---- NEW TURN ----"
      end
    end  
  end

  def putsWinnerMsg(p)
    puts "Player #{p.id} wins with a score of #{p.outputPlayerScore}/3"
    puts "---- GAME OVER ----"
    puts "Good bye!"
  end

  #switch currentPlayer
  def switchCurrentPlayer
    #now switch player turn
    #puts "the currentPlayer was: #{self.currentPlayer}"
    if self.currentPlayer == 1
      self.currentPlayer = 2
    else
      self.currentPlayer = 1
    end
    #puts "the currentPlayer is NOW: #{self.currentPlayer}"
  end

  def getPlayerObj(currentPlayer)
    if currentPlayer.to_i == 1
      return @p1
    else
      return @p2
    end
  end

  #input answer
  def inputAndCheckAnswer(a, p1, p2)
    if @answer == a.to_i #correct
      puts "Player #{currentPlayer}: YES! You are correct"
      switchCurrentPlayer #switch current player
    else
      puts "Player #{currentPlayer}: Seriously? No!"
      getPlayerObj(currentPlayer).updateScore #updates loser score
      switchCurrentPlayer #switch current player
    end
    outputGameScore
  end

  def outputGameScore
    puts "P1: #{@p1.outputPlayerScore}/3 vs P2: #{@p2.outputPlayerScore}/3"
  end
end