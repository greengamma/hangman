first = 'building'
second = ''
user_letter = 'g'
positions = []

first.each_char do |char|
  second += "_"
end

first.each_char.with_index do |char, index|
  positions << index if char == user_letter
end

positions.each do |pos|
  second[pos] = user_letter
end

puts second
