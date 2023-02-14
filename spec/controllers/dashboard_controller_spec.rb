require 'rails_helper'

RSpec.describe DashboardController, type: :controller do

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
