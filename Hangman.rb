$chances = 5
$words = ["game", "germany", "university", "bremen", "webdeveloptment", "ruby", "hangman"]

$current_word = ""
$guessed_chars_hash = Hash.new("no")
$check



class Hangman


  def select_word
    $current_word = $words[rand($words.length)]
  end

  def display_game
    text = ""
    $current_word.split("").each do |i|
      if $guessed_chars_hash[i] == "no"
        text += "_ "
      else
        text += i + " "
      end
    end

    puts text
    puts "Chances left: #{$chances}"
    puts "_________________________"
  end

  def askInput
    puts "Name a character or guess the whole word!"
    guess = gets.chomp

    if guess.length > 1
      if guess == $current_word
        $current_word.split("").each do |i|
          $guessed_chars_hash[i] = "yes"
        end
        $hangman.display_game
        puts "You guessed the word!"
        $hangman.playAgain
        return
      end
    end

    correct = false

    $current_word.split("").each do |i|
      if guess == i
        $guessed_chars_hash[guess] = "yes"
        correct = true
        break
      end
    end

    if correct
      puts "That's correct! The word has the character #{guess}"
    else
      puts "Wrong! You just lost a chance :("
      $chances -= 1
    end

    $hangman.check

  end

  def check

    if $chances <= 0
      puts "YOU LOST!"
      $hangman.playAgain
      return
    end

    $check = true

    $current_word.split("").each do |i|
      if $guessed_chars_hash[i] == "no"
        $check = false
        break
      end
    end

    if $check
      $hangman.display_game
      puts "You guessed the word!"
      $hangman.playAgain
    else
      $hangman.display_game
      $hangman.askInput
    end
  end

  def playAgain
    puts "Do you want to play again? (yes/no)"
    answer = gets.chomp
    answer.downcase
    if answer == "yes"
      $chances = 5
      $guessed_chars_hash = Hash.new("no")
      $hangman.select_word
      $hangman.display_game
      $hangman.askInput
    end
  end

end

$hangman = Hangman.new

$hangman.select_word
$hangman.display_game
$hangman.askInput