class Vendor

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
   pot_rev = 0.0
   @inventory.each do |item, amount|
      pot_rev += item.price * amount
    end
    pot_rev
  end
end
