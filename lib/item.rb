class Item

  attr_reader :name, :price
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @price = attributes.fetch(:price).delete("$").to_f
  end
end
