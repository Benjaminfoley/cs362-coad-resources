require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
    let(:admin) { create(:user, :admin) }
    before do
        admin.confirm
        log_in_as(admin)
    end
    it 'approves an organization' do
        organization = create(:organization)
        click_on 'Organizations'
        click_on 'Pending'
        click_on 'Review'
        click_on 'Approve'
        expect(page).to have_content('approved')
    end
end
