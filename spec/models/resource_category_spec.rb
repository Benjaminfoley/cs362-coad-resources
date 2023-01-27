# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) { ResourceCategory.new }
  # let(:active1) {ResourceCategory.new}
  # let(:active2) {ResourceCategory.new}

  # Attributes.
  # Double check that attributes below this line are actually attributes.
  # Double check that they should be tested in this way.
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
    # I think instead of organizations we want resource_category_id from organizations table.
    it { should have_many(:tickets) }
    # I think instead of tickets we want resource_category_id from tickets table.
  end

  # 3.1 Validations
  describe 'validates the presence of name' do
    it { should validate_presence_of(:name) }
  end

  describe 'validates the length of name' do
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
  end

  describe 'validates the uniqueness of name' do
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  # 3.2 Member Functions
  it 'can activate' do
    resource_category.activate
    expect(resource_category.active).to be true
  end

  it 'can deactivate' do
    resource_category.deactivate
    expect(resource_category.active).to be false
  end

  it 'can check active status' do
    resource_category.activate
    expect(resource_category.inactive?).to be false
    resource_category.deactivate
    expect(resource_category.inactive?).to be true
  end

  it 'has a to-string method' do
    expect(resource_category.to_s).to be resource_category.name
  end

  # 3.3 Static Functions
  describe 'has an unspecified static method' do
    it {
      expect(ResourceCategory.find_by_name('Unspecified')).to be_nil
      ResourceCategory.unspecified
      expect(ResourceCategory.find_by_name('Unspecified')).to_not be_nil
    }
  end

  # 3.4 Scope Methods
  describe 'has a scope method to check for active records' do
    let(:active1) {ResourceCategory.new(id: 1, name: 'Name1', active: true)}
    let(:active2) {ResourceCategory.new(id: 2, name: 'Name2', active: true)}
    active_records = ResourceCategory.active
    it { expect(active_records).to match(ResourceCategory.where(active: true)) }
  end

  describe 'has a scope method to check for inactive records' do
    let(:inactive1) {ResourceCategory.new(id: 1, name: 'Name1', active: false)}
    let(:inactive2) {ResourceCategory.new(id: 2, name: 'Name2', active: false)}
    inactive_records = ResourceCategory.inactive
    it { expect(inactive_records).to match(ResourceCategory.where(active: false)) }
  end
end
