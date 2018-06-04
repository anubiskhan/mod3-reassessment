require 'rails_helper'

describe 'I' do
  describe 'interact with api/v1/items' do
    it 'responds with all items' do
      10.times do |i|
        item = Item.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200"
        )
        puts "Item #{i}: #{item.name} created!"
      end

      get '/api/v1/items'

      expect(response.body).to include('200')

      body = JSON.parse(response.body)

      expect(body.count).to eq(10)
      expect(body[0]).to include('id')
      expect(body[0]).to include('name')
      expect(body[0]).to include('description')
      expect(body[0]).to include('image_url')
      expect(body[0]).to include('image_url')
      expect(body[0]).to_not include('created_at')
      expect(body[0]).to_not include('updated_at')
    end

    it 'responds with an item' do
      10.times do |i|
        item = Item.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200"
        )
        puts "Item #{i}: #{item.name} created!"
      end

      get '/api/v1/items/1'

      expect(response.body).to include('200')

      body = JSON.parse(response.body)

      expect(body).to include('id')
      expect(body).to include('name')
      expect(body).to include('description')
      expect(body).to include('image_url')
      expect(body).to include('image_url')
      expect(body).to_not include('created_at')
      expect(body).to_not include('updated_at')
    end

    it 'deletes an item' do
      10.times do |i|
        item = Item.create!(
          name: Faker::Commerce.product_name,
          description: Faker::Lorem.paragraph,
          image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200"
        )
        puts "Item #{i}: #{item.name} created!"
      end
      expect(Item.count).to eq(10)

      delete '/api/v1/items/1'

      expect(response.body).to include('204')

      expect(Item.count).to eq(9)
    end

    it 'creates an item' do
      expect(Item.count).to eq(0)

      post '/api/v1/items', params: { name: 'Bilbo', description: 'Hobbit Bobbit', image_url: 'https://vignette.wikia.nocookie.net/characters/images/0/09/Bilbo_baggins.png/revision/latest?cb=20160924001540'}

      expect(response.status).to eq(201)

      expect(response.body).to include('Bilbo')
      expect(response.body).to include('Hobbit Bobbit')
      expect(response.body).to include('https://vignette.wikia.nocookie.net/characters/images/0/09/Bilbo_baggins.png/revision/latest?cb=20160924001540')
    end
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
  end
end
