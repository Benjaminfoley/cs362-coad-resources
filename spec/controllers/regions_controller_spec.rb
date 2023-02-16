require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful 

  context 'as admin user' do
    let(:admin) { create :user, :admin }
    let(:ticket) { create :ticket, id: 1 }
    before(:each) { sign_in admin }
    
    describe 'GET #index' do
      it 'is successful' do
        expect(get(:index)).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      it 'is successful' do
        get :show, params: { id: ticket.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'as organization' do
    let(:organization) {create :user, :organization}
    before(:each) { sign_in organization }

    describe 'GET #index' do
      it 'redirects to dashboard' do
        expect(get(:index)).to redirect_to dashboard_path
      end
    end
  end

  context 'as a non-logged-in user' do
    let(:user) {create :user}
    
    describe 'GET #index' do
      it 'redirects to sign-in' do
        expect(get(:index)).to redirect_to(user_session_path)
      end
    end
  end
end
