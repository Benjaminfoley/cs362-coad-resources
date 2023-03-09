# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Approving an organization', type: :feature do
  it 'approves an organization' do
    admin = create(:user, :admin)
    admin.confirm
    log_in_as(admin)
    organization = create(:organization)
    click_on 'Organizations'
    click_on 'Pending'
    click_on 'Review'
    click_on 'Approve'
    expect(page).to have_content('approved')
  end

  it 'Cant approve as organization' do
    user = create(:user)
    log_in_as(user)
    within(page.find('#navbar')) do
      expect(page).to_not have_content('Organizations')
    end
  end
end
