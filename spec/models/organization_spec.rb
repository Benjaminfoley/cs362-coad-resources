# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new}

  it 'has a name' do
    expect(organization).to respond_to(:name)
  end

  it 'has an agrrement one' do
    expect(organization).to respond_to(:agreement_one)
  end

  it 'has a string representation that is its name' do
    name = 'Past Control'
    result = organization.to_s
  end
end
