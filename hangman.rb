dict_file = File.read("hangman.txt")

dictionary = dict_file.split(" ")
word_length_dict = dictionary.select { |word| word.length > 4 && word.length < 13 }
random_word = word_length_dict.sample
word_length = random_word.length

puts random_word

positions = []

def create_hidden_word(random_word)
  # Create same length word with hiding chars
  hidden_word  = ''
  random_word.each_char do |char|

    hidden_word += "_"
  end

  return hidden_word
end

def check_letter(random_word, user_letter, hidden_word)
  positions = []
  if random_word == @user_letter
    puts "You won, the word is '#{random_word}'!"
    return true
  elsif random_word.include?(@user_letter)
    random_word.each_char.with_index do |char, index|
      positions << index if char == @user_letter
      # fill hidden word with correct user letters at specific pos
      positions.each do |pos|
        hidden_word[pos] = @user_letter
      end
      if hidden_word.include?('_')
        next
      else
        puts "You won, the word is '#{hidden_word}'!"
        return true
      end
    end
    puts hidden_word
  else
    puts "not included"
  end
end

def check_counter(attempts, word_length)
  if word_length - attempts > 0
    remaining_attempts = "Remaining attempts: #{word_length - attempts}."
  else
    remaining_attempts = 0
  end
  return remaining_attempts
end

hidden_word = create_hidden_word(random_word)
game_over = false
attempts = 1

until game_over
  puts "Input a letter as your guess..."
  @user_letter = gets.chomp.downcase

  if game_over = check_letter(random_word, @user_letter, hidden_word)
    break
  else
    attempts += 1
    remaining_attempts = check_counter(attempts, word_length)
  end
  if remaining_attempts == 0
    puts "You lost! The word was '#{random_word}.'"
    game_over = true
  else
    puts remaining_attempts
  end

end
