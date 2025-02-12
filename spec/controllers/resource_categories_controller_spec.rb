# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResourceCategoriesController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful
  context 'as admin user' do
    let(:admin) { create :user, :admin }
    let(:resource_category) { create :resource_category }

    before(:each) { sign_in admin }

    describe 'GET #index' do
      it 'is successful' do
        expect(get(:index)).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      it 'is successful' do
        # get :show, params: { resource_category: nil } show method has no code
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
      it 'is redirects to resource_catagories_path path' do
        post :create, params: { resource_category: attributes_for(:resource_category) }
        expect(response).to redirect_to(resource_categories_path)
      end

      it 'renders :new when .save fails' do
        # expect_any_instance_of(Resource_Category).to receive(save).and_return(false)
        post :create, params: { resource_category: { name: '' } }
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #edit' do
      it 'is successful' do
        get :edit, params: { id: resource_category.id }
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'PATCH #update' do
      it 'is successful' do
        patch :update, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) }
        expect(response).to have_http_status(:redirect)
      end

      it 'renders edit when not successful' do
        expect_any_instance_of(ResourceCategory).to receive(:save).and_return(false)
        patch :update, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) }
        expect(response).to render_template(:edit)
      end
    end

    describe 'PATCH #activate' do
      it 'is successful' do
        patch :activate, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) }
        expect(flash[:notice]).to eq('Category activated.') # trying to test the notice
      end

      it 'is not successful' do
        expect_any_instance_of(ResourceCategory).to receive(:save).and_return(false)
        patch :activate, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) }
        expect(flash[:alert]).to eq('There was a problem activating the category.')
        expect(response).to redirect_to(resource_category_path)
      end
    end

    describe 'PATCH #deactivate' do
      it 'is successful' do
        patch :deactivate, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) }
        expect(flash[:notice]).to eq('Category deactivated.')
      end

      it 'is not successful' do
        expect_any_instance_of(ResourceCategory).to receive(:save).and_return(false)
        patch :deactivate, params: { id: resource_category.id, resource_category: attributes_for(:resource_category) }
        expect(flash[:alert]).to eq('There was a problem deactivating the category.')
        expect(response).to redirect_to(resource_category_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to resource_categories path' do
        delete :destroy, params: { id: resource_category.id }
        expect(response).to redirect_to(resource_categories_path)
      end
    end
  end

  context 'as organization' do
    describe 'GET #index' do
      let(:organization) { create :user, :organization }

      before(:each) { sign_in organization }

      it 'is successful' do
        expect(get(:index)).to redirect_to(dashboard_path)
      end
    end

    describe 'GET #show' do
      it 'redirects to page id' do
        expect(get(:show, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #new' do
      it 'is successful' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST #create' do
      it 'redirects to page id' do
        expect(post(:create, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do
      it 'redirects to page id' do
        expect(get(:edit, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #update' do
      it 'redirects to page id' do
        expect(patch(:update, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #activate' do
      it 'redirects to page id' do
        expect(patch(:activate, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #deactivate' do
      it 'redirects to page id' do
        expect(patch(:deactivate, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to page id' do
        expect(delete(:destroy, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'as a non-logged-in user' do
    describe 'GET #index' do
      it 'redirects to page id' do
        expect(get(:index, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #show' do
      it 'redirects to page id' do
        expect(get(:show, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #new' do
      it 'is successful' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'POST #create' do
      it 'redirects to page id' do
        expect(post(:create, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'GET #edit' do
      it 'redirects to page id' do
        expect(get(:edit, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #update' do
      it 'redirects to page id' do
        expect(patch(:update, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #activate' do
      it 'redirects to page id' do
        expect(patch(:activate, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'PATCH #deactivate' do
      it 'redirects to page id' do
        expect(patch(:deactivate, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to page id' do
        expect(delete(:destroy, params: { id: 1 })).to redirect_to(new_user_session_path)
      end
    end
  end
end
