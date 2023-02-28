require 'rails_helper'

RSpec.describe 'Creating a Region', type: :feature do
     
    let(:admin) { create(:user, :admin) }
     
    before do
        admin.confirm
        log_in_as(admin)
    end
     
    it 'creates a region' do
        click_on 'Regions'
        click_on 'Add Region'
      fill_in 'Name', with: 'Fake Region'
      click_button 'Add Region'
      expect(page).to have_content('Region successfully created.')
    end

end
