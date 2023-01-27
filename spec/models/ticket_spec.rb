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
  describe 'validates the presence of' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:region_id) }
    it { should validate_presence_of(:resource_category_id) }
  end

  describe 'validates the length of' do
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
  end

  describe 'validates phone number has a US contry code' do
    it { should allow_value('+15413983298').for(:phone) }
    it { should allow_value('+15 413 983 298').for(:phone) }
    it { should allow_value('15413983298').for(:phone) }
    it { should allow_value('1-541-398-3298').for(:phone) }
    it { should allow_value('1 (541) 398-3298').for(:phone) }
    it { should allow_value('1 541 398 3298').for(:phone) }
    it { should_not allow_value('(541) 398-3298').for(:phone) }
    it { should_not allow_value('541-398-3298').for(:phone) }
    it { should_not allow_value('398-3298').for(:phone) }
    it { should_not allow_value('+44 888 888 888').for(:phone) }
  end
end
