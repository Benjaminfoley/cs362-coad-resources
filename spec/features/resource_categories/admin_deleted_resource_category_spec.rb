require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
    let!(:resource_category) { create(:resource_category) }
    let(:admin) { create(:user, :admin) }
    
    before do
        log_in_as(admin)
        admin.confirm
        visit resource_categories_path
    end
    
    it 'deletes a resource category' do
        click_link 'Delete'
        expect(page).to have_content('Resource category was successfully destroyed.')
    end
end
