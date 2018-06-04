require 'rails_helper'

describe 'User' do
  describe 'visits root and searches Denver' do
    it 'sees top cuisines and restaurants of Denver' do
      # As a user
      # When I visit "/"
      visit '/'
      # And I fill in a search box with "Denver" and click "search"
      fill_in 'search', with: 'Denver'
      click_on 'search'

      # Then my current path should be "/search" (ignoring params)
      expect(current_path).to eq('/search')
      # And I should see the top 5 cuisines of Denver.
      expect(page).to have_content('cuisine', count: 5)
      # And I should see the top 5 restaurants of Denver
      expect(page).to have_content('Restaurant', count: 5)
      # And I should see the name, address and locality, for each of the 5 restaurants
      expect(page).to have_content('name', count: 5)
      expect(page).to have_content('address', count: 5)
      expect(page).to have_content('locality', count: 5)
      # *BOSS MODE* when I click page 2,

      # I should see the remaining 5 restaurants.

    end
  end
end
