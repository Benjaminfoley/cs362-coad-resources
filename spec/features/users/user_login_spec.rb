# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  it 'log in' do
    user = create(:user)
    visit '/users/sign_in'
    fill_in 'Email', with: user.email.to_s
    fill_in 'Password', with: user.password.to_s
    click_on 'Sign in'
    expect(page).to have_current_path('/dashboard')
  end
end
