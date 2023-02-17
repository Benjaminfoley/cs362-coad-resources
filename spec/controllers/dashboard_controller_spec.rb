require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  context 'as admin user' do
    let(:admin) { create :user, :admin }

    before(:each) { sign_in admin }

    describe 'GET #index' do
      it 'is successful' do
        expect(get(:index)).to have_http_status(:ok)
      end
    end
  end

  context 'as organization' do
    let(:organization) { create :user, :organization }

    before(:each) { sign_in organization }

    describe 'GET #index' do
        # these two tests do the same thing.
        # We should decide which one is more appropriate.
      it 'is successful' do
        expect(get(:index)).to_not be_redirect
      end
      it 'is successful' do
        expect(get(:index)).to have_http_status(:ok)
      end
    end
  end

  context 'as a non-logged-in user' do
    let(:user) { create :user }

    describe 'GET #index' do
      it 'redirects to sign-in' do
        expect(get(:index)).to redirect_to(user_session_path)
      end
    end
  end
end
