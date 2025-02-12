# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do
  # Attributes.
  describe 'Test attributes using factory' do
    let(:resource_category) { FactoryBot.build_stubbed(:resource_category) }
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
      it { should have_many(:tickets) }
    end
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
  describe 'Test methods using factory' do
    # build works here but build_stubbed won't. Not exactly sure why
    let(:resource_category) do
      FactoryBot.build(:resource_category)
    end
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
  describe 'Test scope methods using factory' do
    # By nature of these methods, they must touch the database and therefore use create
    let(:active_resource_category) { FactoryBot.create(:resource_category, active: true) }
    let(:inactive_resource_category) { FactoryBot.create(:resource_category, active: false) }

    it 'can query for active categories' do
      expect(ResourceCategory.active).to eq([active_resource_category])
    end

    it 'can query for inactive categories' do
      expect(ResourceCategory.inactive).to eq([inactive_resource_category])
    end
  end
end
