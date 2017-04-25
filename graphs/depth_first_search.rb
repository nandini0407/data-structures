# Depth First Search : It is a way to explore all the vertices of a graph. It starts at a root vertex
# and explores as far as possible along each branch before backtracking.

def dfs(graph)
  visited = Hash.new

  graph.each do |vertex, _|
    visited[vertex] = Hash.new
    visited[vertex][:state] = "not visited"
  end

  # This is to enable passing by reference in the dfs_visit method, otherwise
  # simply having a variable for integer will get passed by value and does not
  # behave/increment as expected.
  order = Hash.new
  order[:time] = 0

  graph.each do |vertex, _|
    dfs_visit(graph, vertex, visited, order) unless visited[vertex][:state] == "done"
  end

  visited
end

def dfs_visit(graph, vertex, visited, order)
  order[:time] += 1
  visited[vertex][:start] = order[:time]
  visited[vertex][:state] = "now visiting"

  graph[vertex].each do |neighbor| # loops through the adjacency list of the vertex
    if visited[neighbor][:state] == "not visited"
      visited[neighbor][:parent] = vertex
      dfs_visit(graph, neighbor, visited, order)
    end
  end

  visited[vertex][:state] = "done"
  visited[vertex][:parent] = nil unless visited[vertex][:parent]
  order[:time] += 1
  visited[vertex][:finish] = order[:time]
end

p dfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [] }), "\n"
p dfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [] }), "\n"
p dfs({ 1 => [2, 3], 2 => [4, 5], 3 => [6, 7], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [2] }), "\n"
