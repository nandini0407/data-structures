class MaxIntSet
  # O(n) lookup, insert and delete

  def initialize(max)
    @max = max
    @store = Array.new((@max + 1), false)
  end

  def insert(num)
    raise "Out of bounds" if num < 0 || num > @max
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num < 0 || num > @max
    @store[num] = false
  end

  def include?(num)
    raise "Out of bounds" if num < 0 || num > @max
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)

  end
end


class IntSet
  # O(n) lookup, insert and delete

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def inspect
    p @store
  end

  def insert(num)
    unless self.include?(num)
      resize! if @count == num_buckets
      @count += 1
      self[num] << num
    end
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    flattened = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    flattened.each do |el|
      @store[el % num_buckets] << el
    end
    @store
  end
end
