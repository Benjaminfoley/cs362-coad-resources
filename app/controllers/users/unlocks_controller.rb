# frozen_string_literal: true

class Users::UnlocksController < Devise::UnlocksController
  # GET /resource/unlock/new
  # def new
  #   super
  # end

  # POST /resource/unlock
  # def create
  #   super
  # end

  # GET /resource/unlock?unlock_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after sending unlock password instructions
  # def after_sending_unlock_instructions_path_for(resource)
  #   super(resource)
  # end

  # The path used after unlocking the resource
  # def after_unlock_path_for(resource)
  #   super(resource)
  # end
end

#notes on 2/9/23 for signing in a user.

#RSpec.describe DashboardController, type: :controller do
#let(:user) { create(:user) }
#before(:each) { sign_in user }

#describe 'GET #index' do
  #it{ expect(get(:index)).to be_successful }
#end
#end

