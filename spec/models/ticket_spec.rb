# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new }

  describe 'Test attributes using factory' do
    let(:ticket) { FactoryBot.build_stubbed(:ticket) }
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
  end

  describe 'relations' do
    it { should belong_to(:region) }
    it { should belong_to(:resource_category) }
    it { should belong_to(:organization).optional }
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
    it { should_not allow_value('5A1-398-3298').for(:phone) }
    it { should_not allow_value('398-3298').for(:phone) }
    it { should_not allow_value('+44 888 888 888').for(:phone) }
  end

  # 3.2 Functions
  describe 'Test methods using factory' do
    let(:open_ticket) { FactoryBot.build_stubbed(:ticket, id: 1) }
    let(:closed_ticket) { FactoryBot.build_stubbed(:ticket, closed: true, id: 2) }

    it 'has a default status of open' do
      expect(open_ticket.open?).to be true
    end

    it 'can have a status of closed' do
      expect(closed_ticket.open?).to be false
    end

    it 'checks if it is captured by an organization' do
      expect(closed_ticket.captured?).to be true
      expect(open_ticket.captured?).to be true
    end

    it 'has an id associated with its name' do
      expect(open_ticket.to_s).to eq('Ticket 1')
      expect(closed_ticket.to_s).to eq('Ticket 2')
    end
  end

  # 3.3 Static Functions -- There are none
  it 'has no static functions' do
    :skip
  end

  # 3.4 Scope Methods
  describe 'Test scope methods using factory' do
    let(:open_ticket) { FactoryBot.create(:ticket, closed: false, organization_id: nil) }
    let(:closed_ticket) { FactoryBot.create(:ticket, closed: true, id: 1) }

    it 'can query for open tickets' do
      expect(Ticket.open).to match([open_ticket])
    end

    it 'can query for closed tickets' do
      expect(Ticket.closed).to match([closed_ticket])
    end
  end

  describe 'Test scope methods using factory' do
    let(:open_ticket) { FactoryBot.create(:ticket, organization_id: 1) }
    # let(:open_ticket) { FactoryBot.create(:ticket) }
    let(:closed_ticket) { FactoryBot.create(:ticket, closed: true, id: 1) }

    it 'can query for all organizations' do
      expect(Ticket.all_organization).to match([open_ticket])
    end

    it 'can query for an open organization by id' do
      expect(Ticket.organization(1)).to match([open_ticket])
    end

    it 'can query for a closed organization by id' do
      expect(Ticket.closed_organization(1)).to match([closed_ticket])
    end

    it 'can query for a region by id' do
      expect(Ticket.region(1)).to match([open_ticket])
      # expect(Ticket.region(region.id)).to match([open_ticket])
    end

    it 'can query for a resource category by id' do
      expect(Ticket.resource_category(1)).to match([open_ticket])
    end
  end
end
