# frozen_string_literal: true

require 'rails_helper'
# require 'factory_bot'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new }

  # Attributes
  # Double check that attributes below this line are actually attributes.
  # Double check that they should be tested in this way.
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

  # 3.1 Validations
  describe 'validates the presence of' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:primary_name) }
    it { should validate_presence_of(:secondary_name) }
    it { should validate_presence_of(:secondary_phone) }
  end

  describe 'validates email format' do
    it { should allow_value('example@domain.com').for(:email) }
    it { should allow_value('EXAMPLE@DOMAIN.COM').for(:email) }
    it { should allow_value('.example@domain.com').for(:email) }
    it { should allow_value('_example@doman.com').for(:email) }
    it { should allow_value('123_example@doman.com').for(:email) }
    it { should allow_value('ex.ample@doman.com').for(:email) }
    it { should allow_value('exa-mpl.e@doman.com').for(:email) }
    it { should allow_value('exa.mpl.e@doman.com').for(:email) }
    it { should allow_value('exa_mpl_e@doman.com').for(:email) }
    it { should_not allow_value('examample@domain').for(:email) }
    it { should_not allow_value('@domain.com').for(:email) }
    it { should_not allow_value('example.domain.com').for(:email) }
  end

  describe 'validates length of' do
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_length_of(:description).is_at_most(1020) }
  end

  describe 'validates uniqueness of' do
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  # 3.2 Member Functions
  it 'has a default status of submitted' do
    expect(organization.status).to eq('submitted')
  end

  it 'can approve status' do
    organization.approve
    expect(organization.status).to eq('approved')
  end

  it 'can reject a status' do
    organization.reject
    expect(organization.status).to eq('rejected')
  end

  it 'has a to-string method' do
    string = organization.to_s
    expect(string).to be organization.name
  end

  # 3.3 Static Functions -- There are none
  it 'has no static functions' do
    :skip
  end

  # 3.4 Test Scope methods --There are none
  it 'has no scope functions' do
    :skip
  end

  # Goal 4 - factories
  describe 'test the existence of factories' do
    let(:org) { build_stubbed(:organization) }
    # org = build_stubbed(:organization)
    it 'tests the existence of the organization factory' do
      # org = build_stubbed(:organization)
      expect(org.name).to eq("TestOrganization")
    end
  end


end
