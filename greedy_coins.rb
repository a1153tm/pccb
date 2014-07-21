COINS = {
  1 => 10,
  5 => 10,
  10 => 10,
  50 => 10,
  100 => 10,
  500 => 2
}

def greedy_calc(coins, sum)
  ans = {}
  _coins = coins.sort do |a, b|
    b <=> a
  end
  _coins.each do |val, num|
    t = [sum / val, num].min
    sum -= val * t
    ans[val] = t
  end
  ans
end

ans = greedy_calc(COINS, 1134)
p ans
p ans.values.inject(0) {|sum, n| sum + n}

