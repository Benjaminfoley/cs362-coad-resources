require 'rails_helper'

RSpec.describe OrganizationsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful
  context 'as admin user' do

    describe 'GET #index' do pending "Not yet implemented"
    end

    describe 'GET #show' do pending "Not yet implemented"
    end

    describe 'POST #create' do pending "Not yet implemented"
    end

    describe 'GET #edit' do pending "Not yet implemented"
    end

    describe 'PATCH #update' do pending "Not yet implemented"
    end

    describe 'POST #approve' do pending "Not yet implemented"
    end

    describe 'POST #reject' do pending "Not yet implemented"
    end
  end

  context 'as organization' do

    describe 'GET #index' do pending "Not yet implemented"
    end

    describe 'GET #show' do pending "Not yet implemented"
    end

    describe 'POST #create' do pending "Not yet implemented"
    end

    describe 'GET #edit' do pending "Not yet implemented"
    end

    describe 'PATCH #update' do pending "Not yet implemented"
    end

    describe 'POST #approve' do pending "Not yet implemented"
    end

    describe 'POST #reject' do pending "Not yet implemented"
    end
  end

  context 'as a non-logged-in user' do

    describe 'GET #index' do pending "Not yet implemented"
    end

    describe 'GET #show' do pending "Not yet implemented"
    end

    describe 'POST #create' do pending "Not yet implemented"
    end

    describe 'GET #edit' do pending "Not yet implemented"
    end

    describe 'PATCH #update' do pending "Not yet implemented"
    end

    describe 'POST #approve' do pending "Not yet implemented"
    end

    describe 'POST #reject' do pending "Not yet implemented"
    end
  end
end
