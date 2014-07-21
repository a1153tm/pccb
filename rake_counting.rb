_rake = <<EOS
W........WW.
.WWW.....WWW
....WW...WW.
.........WW.
.........W..
..W......W..
.W.W.....WW.
W.W.W.....W.
.W.W......W.
..W.......W.
EOS

rake = _rake.split(/\n/)

def dfs(rake, row, col)
  rake[row][col] = "."
  _range = [row - 1, row, row + 1].product [col - 1, col, col + 1]
  range = _range.select do |pair|
    _row, _col = pair[0], pair[1]
    if (_row == row and _col == col) or (_row < 0 or _row > rake.size - 1) or (_col < 0 or _col > rake[row].size - 1)
    then false
    else true
    end
  end
  range.each do |pair|
    _row, _col = pair[0], pair[1]
    dfs(rake, _row, _col) if rake[_row][_col] == "W"
  end
end

def solve(rake)
  ans = 0
  rake.each_with_index do |row, idx_row|
    idx_col = 0
    (0...rake[idx_row].size).each do |idx_col|
      if row[idx_col] == 'W'
        dfs(rake, idx_row, idx_col)
        ans += 1
        puts "#{idx_row}, #{idx_col}"
        print_rake rake, ans
      end
    end
  end
  ans
end

def print_rake(rake, ans)
  puts "---- #{ans} ----"
  rake.each {|row| puts row}
end


p solve(rake)
