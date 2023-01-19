# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it 'exists' do
    Ticket.new
  end

  it 'has a name' do
    ticket = Ticket.new
    expect(ticket).to respond_to(:name)
  end

  it 'has a string representation that is its name' do
    name = 'Mt. Hood'
    ticket = Ticket.new(name: name)
    result = ticket.to_s
  end
end
