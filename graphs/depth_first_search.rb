
def dfs(graph)
  visited = Hash.new
  parents = Hash.new

  graph.each do |vertex, _|
    dfs_visit(graph, vertex, visited, parents) unless visited[vertex]
  end
  parents
end

def dfs_visit(graph, vertex, visited, parents)
  graph[vertex].each do |neighbor|
    unless visited[vertex]
      parents[neighbor] = vertex
      dfs_visit(graph, neighbor, visited, parents)
    end
  end
  visited[vertex] = true
end

p dfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [] })
