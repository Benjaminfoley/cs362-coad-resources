require 'rails_helper'

RSpec.describe 'Creating an Organization Application', type: :feature do
  scenario 'sign up' do
    visit "/"
    click_on 'Sign up'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: '1234567'
    fill_in 'Password confirmation', with: '1234567'
    click_button "Sign up"
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
  end
end
