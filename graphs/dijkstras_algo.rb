# Dijkstra's algorithm : Given a non-negative, weighted graph it computes
# the shortest path from a source vertex s to all other vertices (Cycles may
# be present, but since all weights are non-negative, the algorithm would
# still work). This is a greedy algorithm.
#
# The algorithm first initializes the distances of all vertices to infinity
# and all predecessors to nil. The distance of s is initialized to 0. The
# visited state of all vertices is also set to false.
#
# The following implementation uses nested loops in the next step (a more
# efficient implementation makes use of heaps). While there are unvisited
# vertices still remaining in the graph, the algorithm goes through the
# graph to get the next unvisited vertex with the minimum distance from s.
# It then relaxes each edge that leaves this vertex (more on relaxation in
# graphs/bellman_ford.rb). The process is repeated till all the vertices
# are visited. It returns the paths hash which has the shortest distance,
# and the parent of each vertex while trying to reach there from s.
#
# The following implementation takes O(V^2 + E)... ?
# The more efficient implementation using heaps will take O(VlogV + E).

def dijkstra(graph, s)
  paths = Hash.new

  graph.each do |vertex, _|
    paths[vertex] = Hash.new
    paths[vertex][:distance] = Float::INFINITY
    paths[vertex][:parent] = nil
    paths[vertex][:visited] = false
  end
  paths[s][:distance] = 0

  remaining = true

  while remaining
    remaining = false
    minimum = nil
    current = nil

    paths.each do |vertex, _|
      if !paths[vertex][:visited]
        remaining = true
        if minimum.nil? || paths[vertex][:distance] < minimum
          minimum = paths[vertex][:distance]
          current = vertex
        end
      end
    end

    unless current.nil? || minimum.nil?
      paths[current][:visited] = true
      graph[current].each do |neighbor|
        if paths[neighbor[0]][:distance] > (paths[current][:distance] + neighbor[1])
          paths[neighbor[0]][:distance] = (paths[current][:distance] + neighbor[1])
          paths[neighbor[0]][:parent] = current
        end
      end
    end
  end

  paths

end

p dijkstra({ :s => [[:t, 10], [:y, 5]], :t => [[:x, 1], [:y, 2]], :x => [[:z, 4]],
                    :y => [[:t, 3], [:x, 9], [:z, 2]], :z => [[:s, 7], [:x, 6]] }, :s)
