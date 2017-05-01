class Node

  attr_accessor :children, :is_end

  def initialize
    @children = Array.new(26) { nil }
    @is_end = false
  end

end

class Trie

  LETTERS = ('a'..'z').to_a

  def initialize
    @root = Node.new
  end

  def insert(word)
    Trie.insert(word, 0, @root)
  end

  def find(word)
    # returns true if a) word is present AND b) it is a valid word, ie, @is_end is true
    Trie.find(word, 0, @root)
  end

  def self.insert(word, i, node)
    if i == word.length
      node.is_end = true
      return
    else
      idx = LETTERS.index(word[i])
      if node.children[idx].nil?
        n = Node.new
        node.children[idx] = n
      end
      Trie.insert(word, i + 1, node.children[idx])
    end
  end

  def self.find(word, i, node)

    if i == word.length
      val = node.is_end ? true : false
    else
      idx = LETTERS.index(word[i])
      return false if node.children[idx].nil?
      Trie.find(word, i + 1, node.children[idx])
    end
  end

end

t = Trie.new
t.insert('cats')
t.insert('lamp')
p t.find('cats') # true
p t.find('catsaa') # false
t.insert('cat')
p t.find('cat') # true
p t.find('lamp') # true
p t.find('lamps') # false
