random_word = 'building'
hidden_word = ''
positions = []

# Create same length word with hiding chars
random_word.each_char do |char|
  hidden_word += "_"
end

game_over = false

until game_over
  puts "Input a letter as your guess..."
  user_letter = gets.chomp.downcase

  if random_word.include?(user_letter)
    random_word.each_char.with_index do |char, index|
      positions << index if char == user_letter
      # fill hidden word with correct user letters at specific pos
      positions.each do |pos|
        hidden_word[pos] = user_letter
      end
    end
    puts hidden_word
    game_over = true
  else
    puts "not included"
    game_over = true
  end
end
