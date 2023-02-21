require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  describe 'full title' do
    it 'no title' do
      expect(full_title()).to eq('Disaster Resource Network')
    end 

    it 'with title' do
      expect(full_title('page')).to eq('page | Disaster Resource Network')
    end
  end

end
