require 'rails_helper'

feature 'user can search for house memebers' do
  
  scenario 'user submits valid state name' do
    # As a user
    # When I visit "/"
    visit '/'

    # And I select "Colorado" from the dropdown
    select 'Colorado', from: :state

    # And I click on "Locate Members of the House"
    click_on 'Locate Members of the House'

    # Then my path should be "/search" with "state=CO" in the parameters
    expect(current_path).to eq(search_path)

    # And I should see a message "7 Results"
    expect(page).to have_content('7 Results')

    # And I should see a list of the 7 members of the house for Colorado
    expect(page).to have_css('.member', count: 7)

    # And I should see a name, role, party, and district for each member
    within(first('.member')) do
      expect(page).to have_css('.name')
      name = find('.name').text
      expect(name).not_to be_empty
      
      expect(page).to have_css('.role')
      role = find('.role').text
      expect(role).not_to be_empty
      
      expect(page).to have_css('.party')
      party = find('.party').text
      expect(party).not_to be_empty
      
      expect(page).to have_css('.district')
      district = find('.district').text
      expect(district).not_to be_empty
    end
  end
end