# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'exists' do
    User.new
  end

  it 'has a email' do
    user = User.new
    expect(user).to respond_to(:email)
  end

  it 'has a string representation that is its email' do
    email = 'test@domain.com'
    user = User.new(email: email)
    result = user.to_s
  end
end
