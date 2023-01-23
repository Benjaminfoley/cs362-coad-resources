# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  
  it 'has an email attribute' do
    expect(user).to respond_to(:email)
  end

  it 'has a role attribute' do
    expect(user).to respond_to(:role)
  end

  describe 'relations' do
    it { should belong_to(:organization) }
    #I think instead of organizations we want organization_id from organizations table.
  end

  it 'has a string representation that is its email' do
    email = 'test@domain.com'
    result = user.to_s
  end
end
