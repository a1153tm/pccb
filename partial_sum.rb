def dfs(elems, sum, ans)
  return sum == ans if elems.empty?
  return true if dfs(elems[1..-1], sum, ans)
  return true if dfs(elems[1..-1], sum + elems[0], ans)
  false
end

# solve
if dfs([1,2,4,7], 0, 13)
then puts "YES"
else puts "NO"
end

