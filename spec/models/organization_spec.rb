# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it 'exists' do
    Organization.new
  end

  it 'has a name' do
    organization = Organization.new
    expect(organization).to respond_to(:name)
  end

  it 'has a string representation that is its name' do
    name = 'Past Control'
    organization = Organization.new(name: name)
    result = organization.to_s
  end
end
