require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  it'log in' do
    user = create(:user)
    visit '/users/sign_in'
    fill_in "Email", with:"#{user.email}"
    fill_in "Password", with:"#{user.password}"
    click_on "Sign in"
    save_and_open_page
    expect(page).to have_current_path("/dashboard")
  end

end
