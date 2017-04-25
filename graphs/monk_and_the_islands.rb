# Monk visits the land of Islands. There are a total of N islands numbered from 1 to N. Some pairs of
# islands are connected to each other by Bidirectional bridges running over water. Monk hates to cross
# these bridges as they require a lot of effort. He is standing at Island #1 and wants to reach the
# Island #N. Find the minimum the number of bridges that he shall have to cross, if he takes the optimal route.
#
# Solution : Use BFS

def monk_and_islands(islands, n) # islands is the graph that denotes bridge connections between islands
  queue = []
  visited = Hash.new
  distances = Hash.new

  queue << 1
  distances[1] = 0

  until queue.empty?
    current = queue.shift
    visited[current] = true

    islands[current].each do |neighbor|
      unless visited[neighbor]
        queue << neighbor
        if distances[neighbor]
          distances[neighbor] = [(distances[current] + 1), distances[neighbor]].min
        else
          distances[neighbor] = distances[current] + 1
        end
      end
    end
  end

  distances[n]
end

puts monk_and_islands({ 1 => [2], 2 => [3], 3 => [] }, 3)
puts monk_and_islands({ 1 => [2], 2 => [3, 4], 3 => [4], 4 => [2] }, 4)
