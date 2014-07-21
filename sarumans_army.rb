R = 10
X = [1, 7, 15, 20, 30, 50]

def find_to_mark(from)
  j = from
  while X[j + 1] and X[from] + R >= X[j + 1] do
    j += 1
  end
  j
end

i = 0
marked = []

while i < X.length do
  m = find_to_mark(i)
  marked << m
  i = m
  while  X[i] and X[m] + R >= X[i] do
    i += 1
  end
end

p marked.size
marked.each do |m|
  p X[m]
end
