# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new }

  # Double check that all these attributes are actually attributes
  # and that they are being tested correctly.
  it 'has a region attribute' do
    expect(ticket).to respond_to(:region)
  end

  it 'has a resource_category attribute' do
    expect(ticket).to respond_to(:resource_category)
  end

  it 'has a validates_presence_of attribute' do
    expect(ticket).to respond_to(:validates_presence_of)
  end

  it 'has a validates_length_of attribute' do
    expect(ticket).to respond_to(:validates_length_of)
  end

  it 'has a name attribute' do
    expect(ticket).to respond_to(:name)
  end

  it 'has a phone attribute' do
    expect(ticket).to respond_to(:phone)
  end

  it 'has a region_id attribute' do
    expect(ticket).to respond_to(:region_id)
  end

  it 'has a resource_category_id attribute' do
    expect(ticket).to respond_to(:resource_category_id)
  end

  it 'has a description attribute' do
    expect(ticket).to respond_to(:description)
  end

  it 'has a closed attribute' do
    expect(ticket).to respond_to(:closed)
  end

  describe 'relations' do
    it { should belong_to(:region) }
    #possible change to id from region table
    it { should belong_to(:resource_category) }
    #possible change to id from resource_category table
    it { should belong_to(:organization) }  # the .optional method is apparently for Rails 5+ only
    #possible change to id from organization table
  end

  it 'has a string representation that is its name' do
    name = 'Mt. Hood'
    result = ticket.to_s
  end
end

#3.1 validating presence of attributes
describe 'should validate_presence_of'do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:region_id) }
  it { should validate_presence_of(:resource_category_id) }
end

#3.1 validating length of attributes
describe 'should validate_length_of'do
  it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
  it { should validate_length_of(:description).is_at_most(1020) }
end

#3.1 validating 
describe 'should validate' do
  it { should validate(:phone).phony_plausible }
end


