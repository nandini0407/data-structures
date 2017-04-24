require 'thread'

def bfs(graph, s) # s is the source vertex from which we will traverse the entire graph
  queue = Queue.new
  distances = Hash.new
  parents = Hash.new
  visited = Hash.new

  queue << s
  distances[s] = 0
  parents[s] = nil

  while !queue.empty?
    current = queue.pop
    visited[current] = true

    graph[current].each do |neighbor|
      unless visited[neighbor]
        queue << neighbor
        distances[neighbor] = distances[current] + 1
        parents[neighbor] = current
      end
    end
  end

  p "distances", distances
  p "parents", parents
end

bfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [] }, 1)
