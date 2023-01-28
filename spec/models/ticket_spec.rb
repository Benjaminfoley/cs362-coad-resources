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
  it 'can check the open status' do
    expect(ticket.open?).to be true
    ticket = Ticket.new(closed: true)
    expect(ticket.open?).to be false
  end

  it 'checks if it is captured by an organization' do
    expect(ticket.captured?).to be false
    # need to create an Organization object and add it to the database useing .create() or .save!
    organization = Organization.create!(
      name: "Org",
      id: 1,
      primary_name: "PrimaryName",
      secondary_name: "SecondaryName",
      phone: "1-800-222-2222",
      secondary_phone: "1-555-555-55555",
      email: "example@domain.com"
    )
    region = Region.create!(name: 'Region1')
    resource_category = ResourceCategory.create!(name: "RC1")
    ticket = Ticket.create!(
      name: "TicketName",
      phone: "1-888-888-8888",
      organization_id: 1,
      region: region,
      resource_category: resource_category
    )
    expect(ticket.captured?).to be true
  end

  it 'returns "Ticket #{id}" from to_s' do
    organization = Organization.create!(
      name: "Org",
      id: 1,
      primary_name: "PrimaryName",
      secondary_name: "SecondaryName",
      phone: "1-800-222-2222",
      secondary_phone: "1-555-555-55555",
      email: "example@domain.com"
    )
    region = Region.create!(name: 'Region1')
    resource_category = ResourceCategory.create!(name: "RC1")
    ticket = Ticket.create!(
      name: "TicketName",
      phone: "1-888-888-8888",
      organization_id: 1,
      region: region,
      resource_category: resource_category
    )
    expect(ticket.to_s).to eq('Ticket 1')
    expect(ticket.to_s).to_not eq('Ticket ')
    expect(ticket.to_s).to_not eq('Ticket 2')
  end

  # 3.3 Static Functions -- There are none
  it 'has no static functions' do
    :skip
  end

  # 3.4 Scope Methods
  # scope :open, -> () { where closed: false, organization_id: nil }
  it 'can query for open tickets' do
    region = Region.create!(name: 'Region1')
    resource_category = ResourceCategory.create!(name: "RC1")
    ticket1 =  Ticket.create!(
      name: 'Ticket1',
      closed: false,
      region: region,
      resource_category: resource_category,
      phone: "1800-222-2222"
    )
    ticket2 =  Ticket.create!(
      name: 'Ticket2',
      closed: false,
      region: region,
      resource_category: resource_category,
      phone: "1800-222-2222"
    )
    expect(Ticket.open).to match([ticket1, ticket2])
  end

  # scope :closed, -> () { where closed: true }
  it 'can query for closed tickets' do
    region = Region.create!(name: 'Region1')
    resource_category = ResourceCategory.create!(name: "RC1")
    ticket1 =  Ticket.create!(
      name: 'Ticket1',
      closed: true,
      region: region,
      resource_category: resource_category,
      phone: "1800-222-2222"
    )
    ticket2 =  Ticket.create!(
      name: 'Ticket2',
      closed: true,
      region: region,
      resource_category: resource_category,
      phone: "1800-222-2222"
    )
    expect(Ticket.closed).to match([ticket1, ticket2])
  end

  # scope :all_organization, -> () { where(closed: false).where.not(organization_id: nil) }
  it 'can query for all organizations' do
    region = Region.create!(name: 'Region1')
    resource_category = ResourceCategory.create!(name: "RC1")
    organization = Organization.create!(
      name: "Org",
      id: 1,
      primary_name: "PrimaryName",
      secondary_name: "SecondaryName",
      phone: "1-800-222-2222",
      secondary_phone: "1-555-555-55555",
      email: "example@domain.com"
    )    
    ticket1 =  Ticket.create!(
      name: 'Ticket1',
      closed: false,
      region: region,
      resource_category: resource_category,
      phone: "1800-222-2222",
      organization_id: 1
    )
    ticket2 =  Ticket.create!(
      name: 'Ticket2',
      closed: false,
      region: region,
      resource_category: resource_category,
      phone: "1800-222-2222",
      organization_id: 1
    )
    expect(Ticket.all_organization).to match([ticket1, ticket2])
  end
  
  # scope :organization, -> (organization_id) { where(organization_id: organization_id, closed: false) }
  it 'can query for an open organization by id', :skip do
    
  end
  # scope :closed_organization, -> (organization_id) { where(organization_id: organization_id, closed: true) }
  it 'can query for a closed organization by id', :skip do
    
  end
  # scope :region, -> (region_id) { where(region_id: region_id) }
  it 'can query for a region by id', :skip do
    
  end
  # scope :resource_category, -> (resource_category_id) { where(resource_category_id: resource_category_id) }
  it 'can query for a resource category by id', :skip do
    
  end
end
