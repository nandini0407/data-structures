# A Bipartite Graph is a graph whose vertices can be divided into two independent sets,
# U and V such that every edge (u, v) either connects a vertex from U to V or a vertex
# from V to U. In other words, for every edge (u, v), either u belongs to U and v to V,
# or u belongs to V and v to U. We can also say that there is no edge that connects vertices of same set.
# A bipartite graph is possible if the graph coloring is possible using two colors such that
# vertices in a set are colored with the same color. Note that it is possible to color a cycle
# graph with even cycle using two colors. It is not possible to color a cycle graph with odd cycle using two colors.
# Following is a simple algorithm to find out whether a given graph is Birpartite or
# not using Breadth First Search (BFS).
# 1.	Assign RED color to the source vertex (putting into set U).
# 2.	Color all the neighbors with BLUE color (putting into set V).
# 3.	Color all neighbor’s neighbor with RED color (putting into set U).
# 4.	This way, assign color to all vertices such that it satisfies all the constraints of
#     m way coloring problem where m = 2.
# 5. While assigning colors, if we find a neighbor which is colored with same color as current
#    vertex, then the graph cannot be colored with 2 vertices (or graph is not Bipartite)

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
