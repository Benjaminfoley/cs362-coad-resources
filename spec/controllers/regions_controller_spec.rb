require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  # do we need to check for signed in?
  # describe 'signed in?' do
  #   it 'signed in' do
  #     user = build_stubbed(:user)
  #     expect(sign_in(user)).to be true
  #   end
  # end

  # REMEMBER TO ONLY TEST IF SUCCESSFULL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful 
  describe "GET #index" do
    # let(:user) {build_stubbed(:user)}
    let(:user) {create(:user)}

    it {
    sign_in(user)   # user not signing in?
    expect(get(:index)).to redirect_to(dashboard_path) 
  }
  end

end
