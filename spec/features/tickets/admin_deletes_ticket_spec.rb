# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deleting a Ticket', type: :feature do
  let(:admin) { create :user, :admin }
  let(:ticket) { create :ticket }

  before(:each) { log_in_as admin }

  it 'is successful' do
    visit ticket_path(ticket)
    click_on 'Delete'
    expect(page).to have_content("#{ticket} was deleted.")
  end
end
