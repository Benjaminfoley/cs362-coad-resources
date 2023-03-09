require 'rails_helper'

RSpec.describe 'Closing a ticket', type: :feature do
  it 'creates ticket then logs in to accept it, then closed it' do
    region = create(:region)
    rc = create(:resource_category)
    visit '/'
    click_on 'Get Help'
    fill_in 'Full Name', with: 'test'
    fill_in 'Phone Number', with: '541-123-4565'
    select("#{region.name}", from:"Region")

    select("#{rc.name}",from:'Resource Category')
    fill_in 'Description', with: 'test'
    click_on 'Send this help request'
    expect(page).to have_content("Ticket Submitted")
    user = create(:user, :organization_approved)
    visit '/'
    log_in_as user
    visit '/tickets/1'
    click_on 'Capture'
    visit '/tickets/1'
    click_on 'Close'
    expect(page).to have_current_path("/dashboard")



end

end
