# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new }

  # Attributes
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
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization).optional }
  end

  # Is this a legacy test and does it need to be here?
  it 'has a string representation that is its name' do
    name = 'Mt. Hood'
    result = ticket.to_s
  end

  # 3.1 Validations
  describe 'should validate the presence of' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }
  end

  describe 'should validates_length_of' do
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_most(1020) }
  end

  # #3.1 validating ---Not working---
  # describe 'should validate' do
  #   it {should validates :phone_number, phony_plausible: true}
  # end
end
