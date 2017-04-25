
def is_bipartite?(graph, s)
  queue = []
  visited = Hash.new
  colors = Hash.new

  queue << s
  colors[s] = :red

  until queue.empty?
    current = queue.shift
    visited[current] = true

    graph[current].each do |neighbor|
      unless visited[neighbor]
        if colors[neighbor] == colors[current]
          return false
        else
          queue << neighbor
          new_color = colors[current] == :red ? :blue : :red
          colors[neighbor] = new_color
        end
      end
    end
  end

  true

end

puts is_bipartite?({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [] }, 1)
puts is_bipartite?({ 1 => [2, 3, 4], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [] }, 1)
