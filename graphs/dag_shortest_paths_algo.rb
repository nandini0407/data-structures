# DAG shhortest paths algorithm : This algorithm is used for computing
# shortest paths from a source vertex s to all other vertices in a directed
# acyclic graph (or dag). The dag is first topologically sorted to impose
# a linear ordering on the vertices. If the dag contains a path from vertex
# u to vertex v, then u appears before v in the topological sort. We just
# make one pass over the vertices in their topologically sorted order. As
# we process each vertex, we relax each edge that leaves the vertex. (For
# more on the technique of relaxation, read comments in graphs/bellman_ford.rb)
# The running time of dag shortest paths algo is O(V + E).

def dag_shortest_paths(dag, s)

  # topologically sort the dag
  sorted_vertices = topo_sort(dag)

  paths = Hash.new

  # initialization
  dag.each do |vertex, _|
    paths[vertex] = Hash.new
    paths[vertex][:distance] = Float::INFINITY
    paths[vertex][:parent] = nil
  end
  paths[s][:distance] = 0

  # relax every edge once
  sorted_vertices.each do |vertex|
    dag[vertex].each do |neighbor|
      if paths[neighbor[0]][:distance] > (paths[vertex][:distance] + neighbor[1])
        paths[neighbor[0]][:distance] = (paths[vertex][:distance] + neighbor[1])
        paths[neighbor[0]][:parent] = vertex
      end
    end
  end

  paths
end

def topo_sort(dag)
  sorted_vertices = []

  visited = Hash.new

  dag.each do |vertex, _|
    visited[vertex] = Hash.new
    visited[vertex][:state] = "not visited"
  end

  dag.each do |vertex, _|
    topo_sort_visit(dag, vertex, visited, sorted_vertices) unless visited[vertex][:state] == "done"
  end

  sorted_vertices

end

def topo_sort_visit(dag, vertex, visited, sorted_vertices)
  visited[vertex][:state] = "now visiting"

  dag[vertex].each do |neighbor|
    if visited[neighbor[0]][:state] == "not visited"
      topo_sort_visit(dag, neighbor[0], visited, sorted_vertices)
    end
  end

  visited[vertex][:state] = "done"
  sorted_vertices.unshift(vertex)

end

p dag_shortest_paths({ :r => [[:s, 5], [:t, 3]], :t => [[:x, 7], [:y, 4], [:z, 2]],
                    :x => [[:y, -1], [:z, 1]], :z => [], :s => [[:t, 2], [:x, 6]], :y => [[:z, -2]] }, :s)
