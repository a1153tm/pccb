_maze = <<EOS
#S######.#
......#..#
.#.##.##.#
.#........
##.##.####
....#....#
.#######.#
....#.....
.####.###.
....#...G#
EOS

maze = _maze.split(/\n/)

INF = '--'

def bfs(maze, start)
  searched_path = maze.inject([]) do |_path, line|
    _path << Array.new(line.size, INF)
    _path
  end
  searched_path[start[0]][start[1]] = 0
  que = [start]
  i = 0
  while que.size > 0 do
    row, col = que.pop
    i += 1
    print_path searched_path, i
    _range = [ [row - 1, col], [row + 1, col], [row, col - 1], [row, col + 1] ]
    range = _range.select do |to_row, to_col|
      if to_row < 0 or to_row > maze.size - 1 or to_col < 0 or to_col > maze[0].size - 1
      then false
      else true
      end
    end
    range.each do |to_row, to_col|
      if %w{. G}.include? maze[to_row][to_col] and searched_path[to_row][to_col] == INF
        que << [to_row, to_col]
        searched_path[to_row][to_col] = searched_path[row][col] + 1
      end
    end
  end
  searched_path
end

def print_path(path, i)
  puts "##### #{i} #####"
  path.each do |row|
    line = row.map do |col|
      if col == INF
      then col
      else sprintf("%2d", col)
      end
    end
    puts line.join(' ')
  end
end

shortest_path = bfs(maze, [0, 1])
print_path shortest_path
puts shortest_path[9][8]

