# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) {ResourceCategory.new}

  it 'has an organizations attribute' do
    expect(resource_category).to respond_to(:organizations)
  end

  it 'has an tickets attribute' do
    expect(resource_category).to respond_to(:tickets)
  end

  it 'has a name attribute' do
    expect(resource_category).to respond_to(:name)
  end

  it 'has an validates_presence_of attribute' do
    expect(resource_category).to respond_to(:validates_presence_of)
  end

  it 'has a string representation that is its name' do
    name = 'Camping'
    result = resource_category.to_s
  end
end
