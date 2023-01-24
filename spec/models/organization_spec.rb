# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new}

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
  #wondering if instead of Users as a respond to it should be Organization ID from users table.
  end

  it 'has a tickets attribute' do
    expect(organization).to respond_to(:tickets)
    #wondering if instead of tickets as a respond to it should be Organization ID from tickets table.
  end

  it 'has a resource_categories attribute' do
    expect(organization).to respond_to(:resource_categories)
    #wondering if instead of rosource_categories as a respond to it should be ID from rosource_categories table.
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

  # Code below this line is part of Goal 3. OOPS!
  # Continue working on it next week.
  describe 'should validate the presence of' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
  end

  # describe 'validate the length of email' do
  #   it { should validate_length_of(:email).is_at_least(1) }
  #   it { should validate_length_of(:email).is_at_most(255) }
  # end
  #3.1 validate email
  describe 'validates email' do
    it { should validate (:email) }
  end
  #3.1 validating length of
  describe 'validate length of' do
    it{should validate_length_of(:email).is_at_least(1).is_at_most(255)}
    it{should validate_length_of(:name).is_at_least(1).is_at_most(255)}
    it{should validate_length_of(:description).is_at_most(1020)}



  # validates :email, format: { with: VALID_EMAIL_REGEX }

  # validates_uniqueness_of :email, case_sensitive: false
  # it 'should validate the uniqueness of email' do
  #   expect(organization).to validate_uniqueness_of(:email).scoped_to()
  # end

  # validates_length_of :name, minimum: 1, maximum: 255, on: :create
  # validates_uniqueness_of :name, case_sensitive: false
  # validates_length_of :description, maximum: 1020, on: :create

  it 'has a string representation that is its name' do
    name = 'Past Control'
    result = organization.to_s
  end
end
