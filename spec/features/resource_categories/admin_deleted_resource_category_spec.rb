# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deleting a Resource Category', type: :feature do
  it 'is successful' do
    admin = create(:user, :admin)
    log_in_as  admin
    resource_category = create(:resource_category)
    visit resource_category_path(resource_category)
    click_link 'Delete'
    expect(page).to have_content("Category #{resource_category} was deleted. Associated tickets now belong to the 'Unspecified' category.")
  end
end
