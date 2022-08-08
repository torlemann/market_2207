require './lib/item'

RSpec.describe Item do
  let(:item1) {Item.new({name: 'Peach', price: "$0.75"})}
  let(:item2) {Item.new({name: 'Tomato', price: '$0.50'})}

  it 'exists and has readable attributes' do
    expect(item).to be_a Item
    expect(item2.name).to eq "Tomato"
    expect(item2.price).to eq (0.50)
  end
end
