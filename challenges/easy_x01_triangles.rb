def diamond(letter, delimiter=' ')
  letters = ('A'..'Z').to_a
  counter1 = letters.index(letter)
  counter2 = 1
  arr = letters[0..counter1]
  top_arr = []

  arr.map.with_index do |letter, idx|    
    starting_pattern = delimiter * counter1 + letter
    ending_pattern   = delimiter * counter2 + letter

    top_arr << starting_pattern if idx == 0 
    top_arr << starting_pattern + ending_pattern if idx > 0
    
    counter1 -= 1
    counter2 += 2 if idx > 0
  end  
  
  top_arr + top_arr.reverse[1..-1] # winner winner chicken dinner!
end

delimiter = '-'
puts diamond('E')
puts ""
puts diamond('F',delimiter)