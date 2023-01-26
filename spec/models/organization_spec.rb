# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new(:email = 
    name: pending_organization,
    email: "#{pending_organization.split(" ").join(".")}@testing.com",
    phone: "541-398-3298",
    liability_insurance: true,
    primary_name: 'Primary Name',
    secondary_name: 'Secondary Name',
    secondary_phone: '555-555-5555',
    title: 'Title',
    transportation: :yes,
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                  et dolore magna aliqua. Quam adipiscing vitae proin sagittis nisl rhoncus. Nunc faucibus a pellentesque
                  sit amet porttitor eget dolor morbi. Eu non diam phasellus vestibulum lorem sed risus ultricies tristique.
                  Eu facilisis sed odio morbi quis commodo odio aenean sed. Aliquam purus sit amet luctus venenatis lectus magna.",
    status: 1
  )  
  }

  # Attributes
  it 'has a name' do
    expect(organization).to respond_to(:name)
  end

  it 'has an agreement one' do
    expect(organization).to respond_to(:agreement_one)
  end

  it 'has an agreement two' do
    expect(organization).to respond_to(:agreement_two)
  end

  it 'has an agreement three' do
    expect(organization).to respond_to(:agreement_three)
  end

  it 'has an agreement four' do
    expect(organization).to respond_to(:agreement_four)
  end

  it 'has an agreement five' do
    expect(organization).to respond_to(:agreement_five)
  end

  it 'has an agreement six' do
    expect(organization).to respond_to(:agreement_six)
  end

  it 'has an agreement seven' do
    expect(organization).to respond_to(:agreement_seven)
  end

  it 'has an agreement eight' do
    expect(organization).to respond_to(:agreement_eight)
  end

  it 'has a status attribute' do
    expect(organization).to respond_to(:status)
  end

  it 'has a transportation attribute' do
    expect(organization).to respond_to(:transportation)
  end

  it 'has a set_default_status attribute' do
    expect(organization).to respond_to(:set_default_status)
  end

  # Double check that attributes below this line are actually attributes.
  # Double check that they should be tested in this way.
  it 'has a users attribute' do
    expect(organization).to respond_to(:users)
  end

  it 'has a tickets attribute' do
    expect(organization).to respond_to(:tickets)
  end

  it 'has a resource_categories attribute' do
    expect(organization).to respond_to(:resource_categories)
  end

  it 'has an email attribute' do
    expect(organization).to respond_to(:email)
  end

  it 'has a name attribute' do
    expect(organization).to respond_to(:name)
  end

  it 'has a phone attribute' do
    expect(organization).to respond_to(:phone)
  end

  it 'has a primary_name attribute' do
    expect(organization).to respond_to(:primary_name)
  end

  it 'has a secondary_name attribute' do
    expect(organization).to respond_to(:secondary_name)
  end

  it 'has a secondary_phone attribute' do
    expect(organization).to respond_to(:secondary_phone)
  end

  it 'has a description attribute' do
    expect(organization).to respond_to(:description)
  end

  describe 'relations' do
    it { should have_many(:users) }
    it { should have_many(:tickets) }
    it { should have_and_belong_to_many(:resource_categories) }
  end

  # 3.1 validating presence
  describe 'should validate the presence of' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
  end

  # 3.1 validate email ---Not working---
  describe 'validates email' do
    it{should validate_format_of(:email), with: => VALID_EMAIL_REGEX }
  end

  # 3.1 validating length of
  describe 'validate length of' do
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_most(1020) }
  end

  # 3.1 validating uniqueness
  describe 'validate uniqueness of' do
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  it 'has a string representation that is its name' do
    name = 'Past Control'
    result = organization.to_s
  end
  # 3.2 Test member Functions
  it 'should respond' do
    expect(organization).to respond_to(:approve)
  end

  it 'should respond' do
    expect(organization).to respond_to(:reject)
  end

  it 'should respond' do
    expect(organization).to respond_to(:to_s)
  end
end
