require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful 

  context 'as admin user' do
    let(:admin) {create :user, :admin}
    before(:each) { sign_in admin }
    
    describe 'GET #index' do
      it 'is successful' do
        expect(get(:index)).to have_http_status(:ok)
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

  # describe "GET #index" do
  #   let(:user) {create :user}
  #   let(:organization) {create :user, :organization}

  #   # it 'redirects a non-logged-in user to sign-in' do
  #   #   expect(get(:index)).to redirect_to(sign_in_path) 
  #   # end

  #   it 'redirects an organization user to dashboard' do
  #     sign_in(organization)
  #     expect(get(:index)).to redirect_to dashboard_path
  #   end

  #   it 'is successful for admin user' do
  #     sign_in(admin)
  #     expect(get(:index)).to be success
  #   end
  # end
end
