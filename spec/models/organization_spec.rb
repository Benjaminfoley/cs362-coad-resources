# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { Organization.new}

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

  it 'should have many users' do
    expect(organization).to have_many(:users)
  end

  it 'should have many tickets' do
    expect(organization).to have_many(:tickets)
  end

  it 'should have and belong to many resource_categories' do
    expect(organization).to have_and_belong_to_many(:resource_categories)
  end

  it 'should validate the presence of email' do
    expect(organization).to validate_presence_of(:email)
  end

  # it 'should validate the presence of name' do
  #   expect(organization).to validate_presence_of(:name)
  # end

  # it 'should validate the presence of phone' do
  #   expect(organization).to validate_presence_of(:phone)
  # end

  # it 'should validate the presence of status' do
  #   expect(organization).to validate_presence_of(:status)
  # end
  
  # it 'should validate the presence of primary_name' do
  #   expect(organization).to validate_presence_of(:primary_name)
  # end
  
  # it 'should validate the presence of secondary_name' do
  #   expect(organization).to validate_presence_of(:secondary_name)
  # end
  
  # it 'should validate the presence of secondary_phone' do
  #   expect(organization).to validate_presence_of(:secondary_phone)
  # end

  # it 'has a validates_length_of attribute' do
  #   expect(organization).to validate_presence_of(:validates_length_of)
  # end

  it 'has a string representation that is its name' do
    name = 'Past Control'
    result = organization.to_s
  end
end
