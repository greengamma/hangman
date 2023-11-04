dict_file = File.read("hangman.txt")

dictionary = dict_file.split(" ")
word_length_dict = dictionary.select { |word| word.length > 4 && word.length < 13 }
random_word = word_length_dict.sample

puts random_word
