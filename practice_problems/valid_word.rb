# Given a string and a an array of words (or trie), check if the string is
# a valid word, ie, the string has to be present in the array/trie.

require_relative 'trie.rb'

# using an array, but converting it to a trie
def is_valid_word?(word, dict)
  valid_list = Trie.new
  dict.each do |str|
    valid_list.insert(str)
  end

  valid_list.find(word)
end

puts is_valid_word?('cats', ['nails', 'lamps', 'cats', 'shoes']) # true
puts is_valid_word?('carry', ['nails', 'lamps', 'cats', 'shoes']) # false
