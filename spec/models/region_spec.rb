# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) { Region.new }

  # Attributes
  it 'has a tickets attribute' do
    expect(region).to respond_to(:tickets)
  end

  # Double check that attributes below this line are actually attributes.
  # Double check that they should be tested in this way.
  it 'has a name attribute' do
    expect(region).to respond_to(:name)
  end

  describe 'relations' do
    it { should have_many(:tickets) }
  end

  it 'has a validates_presence_of attribute' do
    expect(region).to respond_to(:validates_presence_of)
  end

  it 'has a validates_length_of attribute' do
    expect(region).to respond_to(:validates_length_of)
  end

  # Is this a legacy test and does it need to be here?
  it 'has a string representation that is its name' do
    name = 'Mt. Hood'
    result = region.to_s
  end

  # 3.1 Validations
  describe 'validates the presence of a name' do
    it { should validate_presence_of(:name) }
  end

  describe 'validates the length of a name' do
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
  end

  describe 'validates the uniqueness of a name' do
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  # 3.2 Member Functions
  describe 'to_s returns region.name' do
    it {
      expect(region.to_s).to be region.name
      region.name = 'test'
      expect(region.to_s).to eq('test')
      expect(region.to_s).to_not be_nil
    }
  end

  # 3.3 Static Functions
  describe 'has an unspecified method' do
    it {
      Region.unspecified
      expect(Region.find_by_name('Unspecified')).to_not be_nil
      expect(Region.find_by_name('')).to be_nil
    }
  end
end
