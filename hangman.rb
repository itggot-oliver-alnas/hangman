def hangman()
  puts "Welcome fuckbois"
  puts "Guess the word or we skin your dick"
  puts "1 letter guesses only or we will screech autistically"
  running = true
  index = 0
  attempts = 5
  guessed = []
  wordlist = File.readlines("words-english.txt")
  word = wordlist.sample
  hidden = []
  word.each_char do |x|
    hidden.push("_ ")
  end
  hidden.pop
  word.upcase!

  while running
    while hidden.include?("_ ") == true
      puts "
      "
      guess = gets.chomp
      while guess.length > 1 || guess.length < 1
        puts "The fuck you doin"
        guess = gets.chomp
      end
      guessed << guess
      guess.upcase!
      index = 0
      if attempts == 0
        puts "ded"
        running = false
      end
      word.each_char do |x|
        if guess == x
          hidden[index] = guess + " "
        else
          attempts -= 1
        end
        index += 1
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
    puts "

    "
    puts "kms"
    puts "Please die #{attempts} more times"
    running = false
  end
end
hangman
