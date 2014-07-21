class Item

  attr_reader :w, :v

  def initialize(w, v)
    @w, @v = w, v
  end

end

ITEMS = {
  Item.new(2, 3),
  Item.new(1, 2),
  Item.new(3, 4),
  Item.new(2, 3)
}

def rec(i, j)
  [ rec(i + 1, j), rec(i + 1, j -]
end

