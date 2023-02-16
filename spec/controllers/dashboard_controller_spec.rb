require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

    describe 'GET index' do
        # let(:user) { FactoryBot.build_stubbed(:user, role: :admin) }
        let(:user) { FactoryBot.create(:user, email: "admin_email@domain.com", password: "DefaultPassword1") }
        let(:status_options) { ['Open', 'Captured', 'Closed'] }

        it 'assigns @status_options' do
            sign_in user
            # debugger
            get :index
            # expect(user.role).to eq("admin")
            # expect(user.admin?).to be true
            expect(assigns(:status_options)).to eq status_options
        end
    end

    # def index
    #     @status_options = status_options
    #     @pagy, @tickets = tickets
    # end

    # Group 1: Admins
    describe 'Admins' do
      let(:signed_in_user) { build_stubbed(:user) }
      before(:each) { sign_in signed_in_user }
      
    end
        # test index

        # NOTE: status_options and tickets are private methods and should not be tested. 
        # test status options

        # test tickets


    # Group 2: Organization
        # test index

        # test status options

        # test tickets


    # Group 3: Normal User
        # test index

        # test status options

        # test tickets
        

end
