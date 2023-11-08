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

def create_random_word

end

end

game = Game.new("hangman.txt")
game.load_file
game.print_file
