S = "ACDBCB"

s = S
t = ""

while (not s.empty?) do
  first = s[0]
  last = s[-1]
  if first < last
    t = t + first
    s = s[1..-1]
  elsif last > first
    t = t + last
    s = s[0..-2]
  else
    r = s.reverse
    if s < r
      t = t + first
      s = s[1..-1]
    else
      t = t + last
      s = s[0..-2]
    end
  end
end

puts t
