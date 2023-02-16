require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

    describe 'GET index' do pending
        let(:user) { build_stubbed(:user) }
        it 'assigns @status_options' do
            get :index
            expect(assigns(:status_options)).to eq('Open')
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
