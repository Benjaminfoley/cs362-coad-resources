require 'rails_helper'

RSpec.describe RegionsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful 

  context 'as admin user' do
    let(:admin) { create :user, :admin }
    let(:ticket) { create :ticket }
    let(:region) { create :region }

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

    describe 'GET #new' do
      it 'is successful' do
        get :new
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do 
      it 'is redirects to regions path'do
        post :create, params: { region: attributes_for(:region) }
        expect(response).to redirect_to(regions_path)
      end
    end

    describe 'GET #edit' do
      it 'is successful' do
        get :edit, params: { id: region.id }
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'PATCH #update' do pending 
      "Not yet implemented"
    end

    describe 'DELETE #destroy' do pending 
      "Not yet implemented"
    end
  end

  context 'as organization' do
    let(:organization) {create :user, :organization}
    let(:ticket) { create :ticket }
    let(:region) { create :region }

    before(:each) { sign_in organization }

    describe 'GET #index' do
      it 'redirects to dashboard' do
        expect(get(:index)).to redirect_to(dashboard_path)
      end
    end

    describe 'GET #show' do
      it 'redirects to dashboard' do
        get :show, params: { id: ticket.id }
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe 'GET #new' do
      it 'redirects to dashboard' do
        get :new
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe 'POST #create' do 
      it 'is redirects to dashboard'do
        post :create, params: { region: attributes_for(:region) }
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe 'GET #edit' do
      it 'redirects to dashboard' do
        get :edit, params: { id: region.id }
        expect(response).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #update' do pending 
      "Not yet implemented"
    end

    describe 'DELETE #destroy' do pending 
      "Not yet implemented"
    end
  end

  context 'as a non-logged-in user' do
    let(:user) {create :user}
    let(:ticket) { create :ticket }
    
    describe 'GET #index' do
      it 'redirects to sign-in' do
        expect(get(:index)).to redirect_to(user_session_path)
      end
    end

    describe 'GET #show' do
      it 'redirects to sign-in' do
        get :show, params: { id: ticket.id }
        expect(response).to redirect_to(user_session_path)
      end
    end

    describe 'GET #new' do
      it 'redirects to sign-in' do
        get :new
        expect(response).to redirect_to(user_session_path)
      end
    end

    describe 'POST #create' do 
      it 'is redirects to sign-in'do
        post :create, params: { region: attributes_for(:region) }
        expect(response).to redirect_to(user_session_path)
      end
    end

    describe 'GET #edit' do pending 
      "Not yet implemented"
    end

    describe 'PATCH #update' do pending 
      "Not yet implemented"
    end

    describe 'DELETE #destroy' do pending 
      "Not yet implemented"
    end
  end
end
