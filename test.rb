require 'json'

class Game
  attr_reader :file_contents

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

end

game = Game.new("hangman.txt")
game.load_file
game.create_random_word
game.create_hidden_word
