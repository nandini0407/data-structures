# There are a total of n courses you have to take, labeled from 0 to n - 1. Some courses may have prerequisites,
# for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1].
# Given the total number of courses and a list of prerequisite pairs, return the ordering of courses you should
# take to finish all courses. There may be multiple correct orders, you just need to return one of them.
# If it is impossible to finish all courses, return an empty array. For example:
# 2, [[1, 0]]
# There are a total of 2 courses to take. To take course 1 you should have finished course 0.
# So the correct course order is [0,1]
# 4, [[1,0],[2,0],[3,1],[3,2]]
# There are a total of 4 courses to take. To take course 3 you should have finished both courses 1 and 2.
# Both courses 1 and 2 should be taken after you finished course 0. So one correct course order is [0,1,2,3].
# Another correct ordering is [0,2,1,3].
#
# Solution : Use topological sorting

def course_scheduling(n, courses)
  visited = Hash.new
  sorted_courses = []

  # convert edge list to adjacency list
  courses = edgelist_to_adjlist(courses)

  courses.each do |course, _|
    visited[course] = Hash.new
    visited[course][:state] = "not visited"
  end

  courses.each do |course, _|
    topo_sort(course, courses, visited, sorted_courses) unless visited[course][:state] == "done"
  end

  sorted_courses
end

def topo_sort(course, courses, visited, sorted_courses)
  visited[course][:state] = "now visiting"

  courses[course].each do |neighbor|
    if visited[neighbor][:state] == "not visited"
      topo_sort(neighbor, courses, visited, sorted_courses)
    end
  end

  visited[course][:state] = "done"
  sorted_courses.unshift(course)
end

# method to convert edge list representation of graphs to adjacency list
def edgelist_to_adjlist(graph)
  adjlist = Hash.new
  graph.each do |edge|
    if adjlist[edge[1]]
      adjlist[edge[1]] << edge[0]
    else
      adjlist[edge[1]] = [edge[0]]
    end

    unless adjlist[edge[0]]
      adjlist[edge[0]] = []
    end

  end
  adjlist
end

# p course_scheduling(4, { 0 => [1, 2], 1 => [3], 2 => [3], 3 => [] })
p course_scheduling(4, [[1, 0], [2, 0], [3, 1], [3, 2]])
