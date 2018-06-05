require 'rails_helper'

describe Restaurant do
  it 'initializes properly' do
    restaurant = Restaurant.new('Zorba', '1234 Fake Street, Kansas, MI 12345', 'Far away')

    expect(restaurant.name).to eq('Zorba')
    expect(restaurant.address).to eq('1234 Fake Street, Kansas, MI 12345')
    expect(restaurant.locality).to eq('Far away')
  end
end
