class Item
  attr_accessor :name, :price

  @@items = []

  def initialize(name,price)
    @name = name
    @price = price
    @@items << self
    # self << Application.items
  end

  def self.all
    @@items
  end

end
