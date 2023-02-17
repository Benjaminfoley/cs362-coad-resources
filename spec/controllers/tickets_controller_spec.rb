# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful
  context 'as admin user' do
    describe 'GET #new' do
      pending 'Not yet implemented'
    end

    describe 'POST #create' do
      pending 'Not yet implemented'
    end

    describe 'GET #show' do
      pending 'Not yet implemented'
    end

    describe 'POST #capture' do
      pending 'Not yet implemented'
    end

    describe 'POST #release' do
      pending 'Not yet implemented'
    end

    describe 'PATCH #close' do
      pending 'Not yet implemented'
    end

    describe 'DELETE #destroy' do
      pending 'Not yet implemented'
    end
  end

  context 'as organization' do
    describe 'GET #new' do
      pending 'Not yet implemented'
    end

    describe 'POST #create' do
      pending 'Not yet implemented'
    end

    describe 'GET #show' do
      pending 'Not yet implemented'
    end

    describe 'POST #capture' do
      pending 'Not yet implemented'
    end

    describe 'POST #release' do
      pending 'Not yet implemented'
    end

    describe 'PATCH #close' do
      pending 'Not yet implemented'
    end

    describe 'DELETE #destroy' do
      pending 'Not yet implemented'
    end
  end

  context 'as a non-logged-in user' do
    describe 'GET #new' do
      pending 'Not yet implemented'
    end

    describe 'POST #create' do
      pending 'Not yet implemented'
    end

    describe 'GET #show' do
      pending 'Not yet implemented'
    end

    describe 'POST #capture' do
      pending 'Not yet implemented'
    end

    describe 'POST #release' do
      pending 'Not yet implemented'
    end

    describe 'PATCH #close' do
      pending 'Not yet implemented'
    end

    describe 'DELETE #destroy' do
      pending 'Not yet implemented'
    end
  end
end
