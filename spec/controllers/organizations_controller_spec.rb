# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful
  context 'as admin user' do
    describe 'GET #index' do
      let(:admin) { create :user, :admin }

      before(:each) { sign_in admin }

      it 'is successful' do
        expect(get(:index)).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      pending 'Not yet implemented'
    end

    describe 'POST #create' do
      pending 'Not yet implemented'
    end

    describe 'GET #edit' do
      pending 'Not yet implemented'
    end

    describe 'PATCH #update' do
      pending 'Not yet implemented'
    end

    describe 'POST #approve' do
      pending 'Not yet implemented'
    end

    describe 'POST #reject' do
      pending 'Not yet implemented'
    end
  end

  context 'as organization' do
    describe 'GET #index' do
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

    describe 'GET #show' do
      pending 'Not yet implemented'
    end

    describe 'POST #create' do
      pending 'Not yet implemented'
    end

    describe 'GET #edit' do
      pending 'Not yet implemented'
    end

    describe 'PATCH #update' do
      pending 'Not yet implemented'
    end

    describe 'POST #approve' do
      pending 'Not yet implemented'
    end

    describe 'POST #reject' do
      pending 'Not yet implemented'
    end
  end

  context 'as a non-logged-in user' do
    describe 'GET #index' do
      let(:user) { create :user }

      describe 'GET #index' do
        it 'redirects to sign-in' do
          expect(get(:index)).to redirect_to(user_session_path)
        end
      end
    end

    describe 'GET #show' do
      it 'redirects to sign-in' do
        expect(get(:show, params: { id: 1 })).to redirect_to(user_session_path)
      end
    end

    describe 'POST #create' do
      pending 'Not yet implemented'
    end

    describe 'GET #edit' do
      pending 'Not yet implemented'
    end

    describe 'PATCH #update' do
      pending 'Not yet implemented'
    end

    describe 'POST #approve' do
      pending 'Not yet implemented'
    end

    describe 'POST #reject' do
      pending 'Not yet implemented'
    end
  end
end
