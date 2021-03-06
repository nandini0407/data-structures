# Given a directed graph, print if the graph has a cycle
#
# Solution : Use DFS. If the state of a vertex is "not visited", then it is the first
# time we are encountering it. If a vertex is visited while its state is "now visiting", then
# there is a cycle present. But if it is already been visited (i.e., its state is "done")
# then it is not a cycle since we may be encountering through a vertex that is outside the cycle. 

def has_cycle?(graph)
  visited = Hash.new

  graph.each do |vertex, _|
    visited[vertex] = Hash.new
    visited[vertex][:state] = "not visited"
  end

  graph.each do |vertex, _|
    unless visited[vertex][:state] == "done"
      result = dfs_visit(graph, vertex, visited)
      return true if result
    end
  end

  false
end

def dfs_visit(graph, vertex, visited)
  visited[vertex][:state] = "now visiting"

  cycle = nil

  graph[vertex].each do |neighbor|
    if visited[neighbor][:state] == "now visiting"
      cycle = true
      break
    elsif visited[neighbor][:state] == "not visited"
      cycle = dfs_visit(graph, neighbor, visited)
    end
  end

  visited[vertex][:state] = "done"
  cycle
end

puts has_cycle?({ 1 => [2], 2 => [5], 3 => [4], 4 => [], 5 => [1], 6 => [5] })
puts has_cycle?({ 1 => [2], 2 => [5], 3 => [4], 4 => [], 5 => [], 6 => [5] })
