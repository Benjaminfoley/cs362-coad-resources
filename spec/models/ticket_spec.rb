# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new }

  it 'has a name' do
    expect(ticket).to respond_to(:name)
  end

  it 'has a string representation that is its name' do
    name = 'Mt. Hood'
    result = ticket.to_s
  end
end
