require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  it'log in' do
    visit '/signup'
    fill_in "Email", with:"test@domain.com"
    fill_in "Password", with:"password"
    fill_in "Password confirmation", with:"password"
    find('input[name="commit"][value="Sign up"]').click
    visit '/users/sign_in'
    fill_in "Email", with:"test@domain.com"
    fill_in "Password", with:"password"
    click_on "Sign in"
    save_and_open_page
    expect(page).to have_current_path("/dashboard")
  end

end
