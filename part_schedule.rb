require 'pp'

class Task

  attr_reader :s, :t

  def initialize(s, t)
    @s, @t = s, t
  end

  def <=>(other)
    @t <=> other.t
  end

end

N = 5
s = [1, 2, 4, 6, 8]
t = [3, 5, 7, 9, 10]

tasks = (0...N).map { |i| Task.new(s[i], t[i]) }

def choose_task(tasks, current_time)
  avairables = tasks.select { |t| t.s >= current_time }
  avairables.min
end

current_time = 0
choosed = []

while (task = choose_task(tasks, current_time)) do
  choosed << task
  current_time = task.t
end

puts choosed.size
pp choosed
