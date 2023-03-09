# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
  it 'getting help, making ticket' do
    region = create(:region)
    rc = create(:resource_category)
    visit '/'
    click_on 'Get Help'
    fill_in 'Full Name', with: 'test'
    fill_in 'Phone Number', with: '541-123-4565'
    select(region.name.to_s, from: 'Region')

    select(rc.name.to_s, from: 'Resource Category')
    fill_in 'Description', with: 'test'
    click_on 'Send this help request'
    expect(page).to have_content('Ticket Submitted')
  end
end
