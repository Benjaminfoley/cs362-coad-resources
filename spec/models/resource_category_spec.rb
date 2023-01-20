# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) {ResourceCategory.new}

  it 'has an organizations attribute' do
    expect(resource_category).to respond_to(:organizations)
  end

  it 'has a tickets attribute' do
    expect(resource_category).to respond_to(:tickets)
  end

  it 'has a name attribute' do
    expect(resource_category).to respond_to(:name)
  end

  it 'has a validates_presence_of attribute' do
    expect(resource_category).to respond_to(:validates_presence_of)
  end

  it 'has a validates_length_of attribute' do
    expect(resource_category).to respond_to(:validates_length_of)
  end

  it 'has an active attribute' do
    expect(resource_category).to respond_to(:active)
  end

  it 'has a string representation that is its name' do
    name = 'Camping'
    result = resource_category.to_s
  end
end
