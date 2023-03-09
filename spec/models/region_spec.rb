# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Region, type: :model do
  describe 'test attributes using factories' do
    let(:region) { FactoryBot.build_stubbed(:region) }

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

  describe 'Test methods using factories' do
    let(:region) { FactoryBot.build_stubbed(:region) }
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
    describe 'has an unspecified static method' do
      it {
        expect(Region.find_by_name('Unspecified')).to be_nil
        Region.unspecified
        expect(Region.find_by_name('Unspecified')).to_not be_nil
      }
    end

    # 3.4 Scope Methods -- There are none
    it 'has no scope functions' do
      :skip
    end
  end
end
