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
    it { should belong_to(:organization).optional }
    # I think instead of organizations we want organization_id from organizations table.
  end

  # 3.1 Validations
  describe 'validates the presence of' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'validates the length of' do
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:password).is_at_least(7).is_at_most(255) }
  end

  describe 'validates the uniqueness of' do
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'validates email format' do
    it { should allow_value('example@domain.com').for(:email) }
    it { should allow_value('EXAMPLE@DOMAIN.COM').for(:email) }
    it { should allow_value('.example@domain.com').for(:email) }
    it { should allow_value('_example@doman.com').for(:email) }
    it { should allow_value('123_example@doman.com').for(:email) }
    it { should allow_value('ex.ample@doman.com').for(:email) }
    it { should allow_value('exa-mpl.e@doman.com').for(:email) }
    it { should allow_value('exa.mpl.e@doman.com').for(:email) }
    it { should allow_value('exa_mpl_e@doman.com').for(:email) }
    it { should_not allow_value('examample@domain').for(:email) }
    it { should_not allow_value('@domain.com').for(:email) }
    it { should_not allow_value('example.domain.com').for(:email) }
  end

  # Is this a legacy test and should it be here?
  it 'has a string representation that is its email' do
    email = 'test@domain.com'
    result = user.to_s
  end

  # 3.2 set default role
  it 'sets a default role' do
    expect(user.role).to eq('organization')
  end

  # 3.2 to_s
  it 'returns the email' do
    user.email = 'example@domain.com'
    expect(user.to_s).to eq(user.email)
  end
end
