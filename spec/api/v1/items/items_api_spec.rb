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
# When I send a GET request to `/api/v1/items`
      get '/api/v1/items'
# I receive a 200 JSON response containing all items
      expect(response.body).to include('200')
# And each item has an id, name, description, and image_url but not the created_at or updated_at
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
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# * Verify that your non-GET requests work using Postman or curl.
# (Hint: `ActionController::API`). Why doesn't the default `ApplicationController` support POST and PUT requests?
  end
end
