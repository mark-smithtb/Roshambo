
#exit if name = "" || " "

    user_engagement_wins = 0
    computer_engagement_wins = 0
class Game
  def initialize
    @user_bout_wins = 0
    @computer_bout_wins = 0
    @computer_match_wins = 0
    @user_match_wins = 0
    @computer_engagement_wins = 0
    @user_engagement_wins = 0
  end

  def user_name
    puts "Please input your name"
    @name = gets.chomp
    exit if @name == "" || " "
  end

  def choice
    puts "Please choose rock, paper, or scissors"
    @user_choice = gets.chomp
    @user_choice = @user_choice.to_sym
    puts "your choice is #{@user_choice}"
    @computer_choice = [:rock, :paper, :scissors].sample
    puts "the computers choice is #{@computer_choice}"
  end

  def engagement
    case
      when @computer_choice == :scissors && @user_choice == :paper
        puts "Scissors cuts paper, the computer is the winner!"
        @computer_engagement_wins += 1
      when @computer_choice == :paper && @user_choice == :rock
        puts "Paper covers rock, the computer is the winner!"
        @computer_engagement_wins += 1
      when @computer_choice == :rock && @user_choice == :sissors
        puts "rock crushes scissors, the computer is the winner!"
        @computer_engagement_wins += 1
      when @computer_choice == :scissors && @user_choice == :rock
        puts "rock crushes scissors, #{@name} is the winner"
        @user_engagement_wins += 1
      when @computer_choice == :paper && @user_choice == :scissors
        puts "Scissors cuts paper, #{@name} is the winner"
        @user_engagement_wins += 1
      when @computer_choice == :rock  && @user_choice == :paper
        puts "Paper covers rock, #{@name} is the winner"
        @user_engagement_wins += 1
      else
        puts "It's a tie"
    end
  end

  def score
    puts @computer_engagement_wins
    puts @user_engagement_wins
    puts @computer_bout_wins
    puts @user_bout_wins

  end

  def bout
    while (@computer_engagement_wins < 2 && @user_engagement_wins < 2)
      choice
      engagement
    end
    if @computer_engagement_wins > @user_engagement_wins
      puts "The computer wins the bout"
      @computer_bout_wins += 1
    elsif @computer_engagement_wins < @user_engagement_wins
      puts "#{@name} wins the bout"
      @user_bout_wins += 1
    else
      puts "error"
    end
    @computer_engagement_wins = 0
    @user_engagement_wins = 0
  end

  def match
    while (@computer_bout_wins < 2 && @user_bout_wins < 2)
      bout
    end
    if @computer_bout_wins > @user_bout_wins
      puts "The computer wins the match"
      @computer_match_wins += 1
    elsif @computer_bout_wins < @user_bout_wins
      puts "#{@name} wins the match"
      @user_match_wins += 1
    else
      puts "error"
    end
  end
end

game = Game.new
game.user_name
game.match
game.score
