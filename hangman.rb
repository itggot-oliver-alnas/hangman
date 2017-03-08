def hangman()
  puts "Welcome to Hangman!"
  puts "Try guessing the secret word!"
  puts "Remember to only input 1 letter!"
  running = true
  index = 0
  attempts = 9999
  guessed = []
  wordlist = File.readlines("words_swedish.txt")
  word = wordlist.sample
  hidden = []
  word.each_char do |x|
    hidden.push("_")
  end
  hidden.pop
  while running
    index = 0
    if attempts == 0
      puts "ded"
      running = false
    elsif hidden.include? ("_") == false
      puts "You win!"
      running = false
    else
      guess = gets.chomp
      guess.upcase
      word.upcase
      word.each_char do |x|
        if guess == x
          hidden[index] = guess
        end
        index += 1
      end
      hidden.each do |z|
        print z
      end
      attempts -= 1
    end
  end
end

hangman
