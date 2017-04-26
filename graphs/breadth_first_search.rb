# Breadth First Search : Given an unweighted graph and a distinguished source vertex s, BFS systematically explores the
# edges of the graph to "discover" every vertex that is reachable from s. It also computes the distance (smallest
# number of edges) from s to each reachable vertex. BFS is useful for calculating the shortest distance between
# two vertices, and also the path corresponding to the shortest distance. It is useful for unweighted graphs.
# The algorithm uses a queue to store all the unexplored neighbors of a given vertex. It shifts off the first vertex
# of the queue in each iteration till it becomes empty.
# Time complexity : O(V + E), i.e, V is the set of vertices and E is the set of edges.

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

  { :distances => distances, :parents => parents }
end

p bfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [] }, 1)
