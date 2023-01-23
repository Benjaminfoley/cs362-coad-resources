# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) {Region.new}

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
    #wondering if instead of tickets as a respond to it should be ID from region id table.
  end

  it 'has a validates_presence_of attribute' do
    expect(region).to respond_to(:validates_presence_of)
  end

  it 'has a validates_length_of attribute' do
    expect(region).to respond_to(:validates_length_of)
  end

  it 'has a string representation that is its name' do
    name = 'Mt. Hood'
    result = region.to_s
  end
end
