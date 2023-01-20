# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) {ResourceCategory.new}

  it 'has a name' do
    expect(resource_category).to respond_to(:name)
  end

  it 'has a string representation that is its name' do
    name = 'Camping'
    result = resource_category.to_s
  end
end
