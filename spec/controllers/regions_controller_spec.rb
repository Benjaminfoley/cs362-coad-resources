require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

  describe "GET #index" do
  let(:user) {build_stubbed(:user)}
    it {
    sign_in(user)   #user not signing in?
    expect(get(:index)).to redirect_to(nil) 
  }
  end

end
