# Bellman-Ford algorithm for shortest paths : This algorithm is used to
# compute the shortest paths from a source vertex to all other vertices
# of a weighted directed graph which can have cycles as well as negative
# weight edges. However, if there is a negative-weight cycle in the
# graph, the algorithm return false to indicate that there is no shortest
# path possible in the graph, since a negative-weight cycle can loop
# an infinite number of times to produce negative infinity as the shortest
# path.
#
# The algorithm first initializes the distances of all vertices to infinity
# and all predecessors to nil. The distance of s is initialized to 0.
#
# In the next step, the algorithm uses the technique of relaxation - which
# is to compare the distance of the current shortest path to a vertex from
# s, with the distance obtained by adding another neighboring edge's weight.
# It picks the shorter of the two and updates the vertex's current shortest
# path to the new shorter distance. It relaxes every edge (V - 1) times. At
# the end, we end up with the shortest possible paths to every vertex from
# s. Once outside this loop, it tries to relax every edge once again. If it
# becomes possible to relax an edge further, then this implies the presence
# of a negative-weight cycle, in which case the algorithm returns false.
# Otherwise it returns true.

def bellman_ford(graph, s)
  paths = Hash.new
  graph.each do |vertex, _|
    paths[vertex] = Hash.new
    paths[vertex][:distance] = Float::INFINITY
    paths[vertex][:parent] = nil
  end

  paths[s][:distance] = 0

  (1...graph.length).each do # iterating (V - 1) times
    graph.each do |vertex, _|
      graph[vertex].each do |neighbor|
        # for an edge (u, v), compare v.distance > (u.distance + weight(u, v))
        if paths[neighbor[0]][:distance] > (paths[vertex][:distance] + neighbor[1])
          paths[neighbor[0]][:distance] = paths[vertex][:distance] + neighbor[1]
          paths[neighbor[0]][:parent] = vertex
        end
      end
    end
  end

  graph.each do |vertex, _|
    graph[vertex].each do |neighbor|
      if paths[neighbor[0]][:distance] > (paths[vertex][:distance] + neighbor[1])
        return false
      end
    end
  end

  paths

end

puts bellman_ford({ :s => [[:t, 6], [:y, 7]], :t => [[:x, 5], [:y, 8], [:z, -4]],
                  :x => [[:t, -2]], :y => [[:x, -3], [:z, 9]], :z => [[:s, 2], [:x, 7]] }, :s)
puts bellman_ford({ :s => [[:t, 6], [:y, 7]], :t => [[:x, -5], [:y, 8], [:z, -4]],
                  :x => [[:t, 2]], :y => [[:x, -3], [:z, 9]], :z => [[:s, 2], [:x, 7]] }, :s)
