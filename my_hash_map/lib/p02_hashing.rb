class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    count = 0
    self.each_with_index do |char, idx|
      next if char == []
      count += char.ord * idx
    end
    count.hash
  end
end

class String
  def hash
    count = 0
    self.split("").each_with_index do |char, idx|
      count += char.ord * idx
    end
    count.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    count = 0
    key_multiplier = 5
    val_multiplier = 3
    self.each do |key, val|
      count += key.to_s.ord * key_multiplier
      count += val.to_s.ord * val_multiplier
    end
    count.hash
  end
end
