# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  
  it 'has a email' do
    expect(user).to respond_to(:email)
  end

  it 'has a string representation that is its email' do
    email = 'test@domain.com'
    result = user.to_s
  end
end
