require 'rails_helper'

RSpec.feature "hit best buy api and return product information" do
  it "user sees 15 results" do
    visit root_path

    fill_in 'Search', with: 'sennheiser'
    click_on "Search"

    expect(current_path).to eq '/search'

    # save_and_open_page
    expect(page).to have_selector('.result', count: 15)

    # expect(page).to have_content "sku"
    # expect(page).to have_content "name"
    # expect(page).to have_content "customer average review"
    # expect(page).to have_content "short description"
    # expect(page).to have_content "sale price"
    # expect(page).to have_content "image"
  end
end
# As a user
# When I visit the "/"
# And I fill in the search box with "sennheiser" and click "search"
# Then my current path should be "/search"
# And I should see exactly 15 results
# And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
