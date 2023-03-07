require 'rails_helper'

RSpec.describe 'Deleting a Region', type: :feature do
    let(:admin) { create :user, :admin }
    let(:region) { create :region }
    
    before(:each) { log_in_as admin }
    
    it 'is successful' do
        visit region_path(region)
        click_on 'Delete'
        expect(page).to have_content("Region #{region} was deleted. Associated tickets now belong to the 'Unspecified' region.")
    end

end
