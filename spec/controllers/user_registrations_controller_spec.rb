# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  context 'as logged-out user' do
    describe 'as logged-out user' do
      it 'POST #create' do
        @request.env['devise.mapping'] = Devise.mappings[:user]
        post(:create, params: { user: attributes_for(:user) })
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
