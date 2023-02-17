require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #index' do
    it 'succeeds' do
      expect(get(:index)).to have_http_status(:ok)
    end
  end
end
