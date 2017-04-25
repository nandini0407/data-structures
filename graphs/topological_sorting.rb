
def topo_sort_no_dfs(dag)

end

# Topological Sorting using DFS : It is one of the applications of DFS. It is performed on a
# directed acyclic graph (or "dag"). Topological sorting of a dag is a linear ordering of all its vertices
# such that if the dag contains an edge (u, v) then u appears before v in the ordering (linear ordering is not possible
# cyclic graphs). We can view a topological sort of a graph as an ordering of its vertices along a horizontal
# line so that all directed edges go from left to right. Topological sorting is different from the usual kind
# of "sorting".
# Topological sort takes O(V + E) time.

def topo_sort_dfs(dag)
  sorted_vertices = []

  visited = Hash.new

  dag.each do |vertex, _|
    visited[vertex] = Hash.new
    visited[vertex][:state] = "not visited"
  end

  dag.each do |vertex, _|
    topo_dfs_visit(dag, vertex, visited, sorted_vertices) unless visited[vertex][:state] == "done"
  end

  sorted_vertices
end

def topo_dfs_visit(dag, vertex, visited, sorted_vertices)
  visited[vertex][:state] = "now visiting"

  dag[vertex].each do |neighbor|  # loops through the adjacency list of the vertex
    if visited[neighbor][:state] == "not visited"
      topo_dfs_visit(dag, neighbor, visited, sorted_vertices)
    end
  end

  visited[vertex][:state] = "done"
  sorted_vertices.unshift(vertex)
end

p topo_sort_dfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [] }), "\n"
p topo_sort_dfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [] }), "\n"
p topo_sort_dfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [2] }), "\n"
