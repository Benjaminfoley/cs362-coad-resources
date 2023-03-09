# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Updating an Organization', type: :feature do
  it 'updates an organization' do
    user = create(:user, :admin)
    log_in_as(user)
    organization = create(:organization)
    visit '/organizations'
    click_on 'Pending'
    click_on 'Review'
    fill_in 'Rejection Reason', with: 'No'
    click_on 'Reject'
    expect(page).to have_content('rejected')
  end
end
