require 'rails_helper'

RSpec.feature "get search results from narrow query" do
  it "sees results from narrow search query" do
    visit root_path

    fill_in "Search", with: "sennheiser headphones white"
    click_on "Search"

    expect(current_path).to eq "/search"

    # expect(page).to have_selector('.result', count: 3)
    save_and_open_page
    expect(page).to have_content "Sku: 9068155"
    expect(page).to have_content "Sku: 9068004"
    expect(page).to have_content "Sku: 9068128"
  end
end

# As a user
# When I visit the "/"
# And I fill in the search box with "sennheiser headphones white" and click "search"
# Then my current path should be "/search"
# And I should see limited results (at the time of writing, 3. SKUs: 9068155, 9068004, 9068128)
# And each result should contain sku, name, customer average review, short description, sale price, and image ONLY
