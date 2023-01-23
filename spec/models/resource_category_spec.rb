# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) {ResourceCategory.new}

  # Double check that all these attributes are actually attributes
  # and that they are being tested correctly.
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

  describe 'relations' do
    it { should have_and_belong_to_many(:organizations) }
    #I think instead of organizations we want resource_category_id from organizations table.
    it { should have_many(:tickets) }
    #I think instead of tickets we want resource_category_id from tickets table.
  end

  it 'has a string representation that is its name' do
    name = 'Camping'
    result = resource_category.to_s
  end
end
