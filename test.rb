require 'json'

class Game
  attr_reader :dict_file

def initialize(file_path)
  @file_path = file_path
  @dict_file = ''
end

def load_file
  if File.exist?(@file_path)
    @dict_file = File.read(@file_path)
  else
    puts "File not found!"
  end
end

def print_file
  puts @dict_file
end

def create_random_word
  @dictionary = @dict_file.split(" ")
  @word_length_dict = @dictionary.select { |word| word.length > 4 && word.length < 13 }
  @random_word = @word_length_dict.sample
  @word_length = @random_word.length
  puts @random_word
  puts @word_length
end

def create_hidden_word
  # Create same length word with hiding chars
  @hidden_word  = ''
  @random_word.each_char do |char|

    @hidden_word += "_"
  end
  puts @hidden_word
end

def check_letter(user_letter)
  @positions = []
  if @random_word == user_letter
    puts "You won, the word is '#{@random_word}'!"
    return true
  elsif @random_word.include?(user_letter)
    @random_word.each_char.with_index do |char, index|
      @positions << index if char == user_letter
      # fill hidden word with correct user letters at specific pos
      @positions.each do |pos|
        @hidden_word[pos] = user_letter
      end
      if @hidden_word.include?('_')
        next
      else
        puts "You won, the word is '#{@hidden_word}'!"
        return true
      end
    end
    puts @hidden_word
  else
    puts "not included"
  end
end

def check_counter(attempts, word_length)
  if @word_length - attempts > 0
    remaining_attempts = "Remaining attempts: #{@word_length - attempts}."
  else
    remaining_attempts = 0
  end
  return remaining_attempts
end

def save_game
 game_state = {
  random_word: @random_word,
  hidden_word: @hidden_word,
  remaining_attempts: @remaining_attempts
 }

 File.open("savegame.json", "w") do |file|
  file.write(game_state.to_json)
 end
puts "Game saved."
end

end

game = Game.new("hangman.txt")
game.load_file
game.create_random_word
game.create_hidden_word

game_over = false
attempts = 1

until game_over
  puts "Input a letter as your guess... (type 'save' to save game!)"
  user_letter = gets.chomp.downcase

  case user_letter
  when 'save'
    game.save_game
    break
  else
    if game_over = game.check_letter(user_letter)
      break
    else
      attempts += 1
      remaining_attempts = game.check_counter(attempts, @word_length)
    end
    if remaining_attempts == 0
      puts "You lost! The word was '#{@random_word}.'"
      game_over = true
    else
      puts remaining_attempts
    end
  end
end
