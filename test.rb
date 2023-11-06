random_word = 'bui'
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
  if random_word.include?(user_letter)
    random_word.each_char.with_index do |char, index|
      positions << index if char == user_letter
      # fill hidden word with correct user letters at specific pos
      positions.each do |pos|
        hidden_word[pos] = user_letter
      end
      if hidden_word.include?('_')
        next
      else
        return true
      end
    end
    puts hidden_word
  else
    puts "not included"
  end
end

hidden_word = create_hidden_word(random_word)
game_over = false

until game_over
  puts "Input a letter as your guess..."
  user_letter = gets.chomp.downcase

  game_over = check_letter(random_word, user_letter, hidden_word)
end
# end
