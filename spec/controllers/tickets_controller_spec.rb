# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful
  context 'as admin user' do
    let(:admin) { create :user, :admin }
    let(:ticket) { create :ticket }
    before(:each) { sign_in admin }

    describe 'GET #new' do
      it 'is successful' do
        expect(get(:new)).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do
      it 'successful' do
        post :create, params: { ticket: attributes_for(:ticket) }
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      it 'successful' do
        expect(get(:show, params: { id: ticket.id })).to have_http_status(:ok)
      end
    end

    describe 'POST #capture' do
      it 'redirects to dashboard' do
        expect(post(:capture, params: { id: ticket.id })).to redirect_to(dashboard_path)
      end
    end

    describe 'POST #release' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: ticket.id })).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #close' do
      it 'redirects to dashboard tickets open' do
        expect(patch(:close, params: { id: ticket.id })).to redirect_to(dashboard_path << '#tickets:open')
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to dashboard' do
        expect(delete(:destroy, params: { id: ticket.id })).to be_redirect
      end
    end
  end

  context 'as organization' do
    let(:organization) { create :user, :organization }

    before(:each) { sign_in organization }

    describe 'GET #new' do
      it 'successful' do
        expect(get(:new)).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do
      it 'successful' do
        post :create, params: { ticket: attributes_for(:ticket) }
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      it 'successful' do pending
        expect(get(:show, params: { id: 1 })).to have_http_status(:ok)
      end
    end

    describe 'POST #capture' do
      it 'redirects to dashboard' do
        expect(post(:capture, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'POST #release' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #close' do
      it 'redirects to dashboard' do
        expect(patch(:close, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to dashboard' do
        expect(delete(:destroy, params: { id: 1 })).to be_redirect
      end
    end
  end

  context 'as a non-logged-in user' do
    describe 'GET #new' do
      it 'redirects to login page' do
        expect(get(:new)).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do
      it 'redirects to login page' do
        expect(post(:create, params: { ticket: attributes_for(:ticket) })).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      pending
    end

    describe 'POST #capture' do
      it 'redirects to dashboard' do
        expect(post(:capture, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'POST #release' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #close' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to dashboard' do
        expect(delete(:destroy, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end
  end
end
