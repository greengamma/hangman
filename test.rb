require 'json'

class Game
  attr_reader :file_contents

def initialize(file_path)
  @file_path = file_path
  @file_contents = ''
end

def load_file
  if File.exist?(@file_path)
    @file_contents = File.read(@file_path)
  else
    puts "File not found!"
  end
end

def print_file
  puts @file_contents
end

  # @dict_file = File.read("hangman.txt")
  # @dictionary = dict_file.split(" ")
  # @word_length_dict = dictionary.select { |word| word.length > 4 && word.length < 13 }
  # @random_word = word_length_dict.sample
  # @word_length = random_word.length

end

game = Game.new("hangman.txt")
game.load_file
game.print_file
