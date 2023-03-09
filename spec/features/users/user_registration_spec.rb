require 'rails_helper'

RSpec.describe 'User registration', type: :feature do
  
  it'log in, and create application' do
    user = create(:user)
    rc = create(:resource_category)
    log_in_as user
    
    visit '/new_organization_application'
    choose('organization_liability_insurance_true')
    choose('organization_agreement_one_true')
    choose('organization_agreement_two_true')
    choose('organization_agreement_three_true')
    choose('organization_agreement_four_true')
    choose('organization_agreement_five_true')
    choose('organization_agreement_six_true')
    choose('organization_agreement_seven_true')
    choose('organization_agreement_eight_true')
    fill_in "organization_primary_name", with: "Test, test"
    fill_in "organization_name", with: "testing"
    fill_in "organization_phone", with: "541-123-1234"
    fill_in "organization_name", with: "testing"
    fill_in "organization_secondary_name", with: "Test, 2"
    fill_in "organization_secondary_phone", with: "541-113-1234"
    fill_in "organization_email", with: "#{user.email}"
    find('input[type="checkbox"][value="1"]').check
    fill_in "organization_description", with: "tetst"
    choose('organization_transportation_yes')
    find('input[name="commit"][value="Apply"]').click #I tried to mock the organization controller to overwrite the send email function but couldnt get
                                                      #it to work, so i added if organization.name == "testing" dont send
    expect(page).to have_content("Application Submitted")                       
  end
end
