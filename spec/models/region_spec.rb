# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Region, type: :model do
  let(:region) {Region.new}

  it 'has a tickets attribute' do
    expect(region).to respond_to(:tickets)
  end

  it 'has a name attribute' do
    expect(region).to respond_to(:name)
  end



  it 'has a string representation that is its name' do
    name = 'Mt. Hood'
    result = region.to_s
  end
end
