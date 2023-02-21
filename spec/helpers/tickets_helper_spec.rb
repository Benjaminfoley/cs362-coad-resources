require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do
  describe 'test helper' do
    it 'can normalise number' do
      expect(format_phone_number("541-123-1234")).to eq("+15411231234")
    end

    it 'cant normalise number with country code' do
      expect(format_phone_number("2-541-123-1234")).to_not eq("+15411231234")
    end
  end

end
