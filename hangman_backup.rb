def hangman()
  puts "Welcome."
  puts "Guess the word"
  puts "1 letter guesses only."
  running = true
  index = 0
  attempts = 5
  guessed = []
  wordlist = File.readlines("words-english.txt")
  word = wordlist.sample
  hidden = []
  right_guess = true
  word.each_char do |x|
    hidden.push("_ ")
  end
  hidden.pop
  word.upcase!

  while running
    while hidden.include?("_ ") == true
      puts "
      "
      if attempts == 0
        puts "ded"
        running = false
        break
      end
      guess = gets.chomp
      while guess.length > 1 || guess.length < 1
        puts "The fuck you doin"
        guess = gets.chomp
      end
      guessed << guess
      guess.upcase!
      index = 0
      word.each_char do |x|
        if guess == x
          hidden[index] = guess + " "
        else
          right_guess = false
        end
        index += 1
      end
      if right_guess == false
        attempts -= 1
      end
      system "cls"
      hidden.each do |z|
        print z
      end
      puts "
      "

      guessed.to_s
      puts "Guessed letters: #{guessed}"

    end
    break
    puts "

    "
    puts "Fine you win."
    puts "You had #{attempts} more attempts."
    running = false
  end
end
hangman
