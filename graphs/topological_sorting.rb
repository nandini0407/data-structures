
def topo_sort_no_dfs(dag)

end

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
