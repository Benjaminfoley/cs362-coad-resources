require 'rails_helper'

RSpec.feature "States", :type => :feature do

  scenario "Admin views list of states" do
    admin = User.create(email: 'example@example.com', password: 'password', password_confirmation: 'password', role: 'admin')
    admin.confirm
    fake_state = State.create(name: 'Fake State')
    log_in_as(admin)
    visit dashboard_url
    click_on 'States'
    expect(page).to have_text('States List')
    expect(page).to have_text('Fake State')
  end

end