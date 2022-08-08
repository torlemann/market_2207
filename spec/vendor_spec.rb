require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}
  let(:vendor) {Vendor.new("Rocky Mountain Fresh")}

  it 'exists and has readable attributes' do
    expect(vendor).to be_a Vendor
    expect(vendor.name).to eq "Rocky Mountain Fresh"
    expect(vendor.inventory).to eq({})
  end

  it 'can check stock' do
    expect(vendor.check_stock(item1)).to eq 0
  end

  it 'can add stock and return inventory' do
    vendor.stock(item1, 30)
    expect(vendor.inventory).to eq {item1 => 30}
    expect(vendor.check_stock(item1)).to eq 30
    vendor.stock(item1, 25)
    expect(vendor.check_stock(item1)).to eq 55
    vendor.stock(item2, 12)
    expect(vendor.inventory).to eq {item1 => 30, items => 12}
  end
end
