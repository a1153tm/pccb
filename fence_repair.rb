def merge(list, ans)
  return ans if list.size == 1
  min0 = list[0]
  min1 = list[1]
  t = min0 + min1
  ans += t
  merge([t] + list[2..-1], ans)
end

#L = [8, 5, 8]
L = [1,1,2,2,3,4,5,6]

sorted = L.sort

p merge(sorted, 0)
