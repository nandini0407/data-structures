class BinaryMinHeap

  def initialize
    # having a dummy 0 as the first element of the heap establishes the following relationships
      # left child of any parent = 2p
      # right child of any parent = 2p + 1
      # parent of any child = c / 2
    @heap_list = [0]
    @current_size = 0
  end

  def heapify_up(i)
    while i / 2 > 0
      @heap_list[i], @heap_list[i / 2] = @heap_list[i / 2], @heap_list[i] if @heap_list[i / 2] > @heap_list[i]
      i /= 2
    end
  end

  def insert(el)
    @heap_list << el
    @current_size += 1
    self.heapify_up(@current_size)
  end

  def heapify_down(i)
    while (i * 2) <= @current_size
      smallest_child_idx = self.smallest_child(i)
      @heap_list[i], @heap_list[smallest_child_idx] = @heap_list[smallest_child_idx], @heap_list[i]
      i = smallest_child_idx
    end
  end

  def smallest_child(i)
    if (i * 2) + 1 > @current_size
      return i * 2
    else
      if @heap_list[i * 2] <= @heap_list[(i * 2) + 1]
        return i * 2
      else
        return (i * 2) + 1
      end
    end
  end

  def delete_minimum
    minimum = @heap_list[1]
    @heap_list[1], @heap_list[@current_size] = @heap_list[@current_size], @heap_list[1]
    @heap_list.pop
    @current_size -= 1
    self.heapify_down(1)
    minimum
  end

  def build_heap(arr)
    m = arr.length / 2
    @current_size = arr.length
    @heap_list = [0] + arr.dup
    while i > 0
      self.heapify_down(i)
      i -= 1
    end
  end

end
