class Market

  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def total_inventory
    total_inventory = Hash.new
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        if !total_inventory.keys.include?(item)
          total_inventory[item] = {quantity: 0, vendors: []}
        end
      end
    end
    total_inventory.each do |item, info|
      vendors_that_sell(item).each do |vendor|
        info[:vendors] << vendor
        info[:quantity] += vendor.inventory[item]
      end
    end
    total_inventory
  end

  def sorted_item_list
    total_inventory.keys.map {|item| item.name}.sort
  end
  
end
