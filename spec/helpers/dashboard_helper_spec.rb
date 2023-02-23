require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  context 'as admin user' do
    let(:admin) { build_stubbed(:user, :admin) }
    # let(:admin) { instance_double('User', admin?: true) }

    #before(:each) { sign_in admin }

    describe 'dashboard_for' do
      it 'admin_dashboard' do
        expect(admin.admin?).to eq(true)
        expect(dashboard_for(admin)).to eq('admin_dashboard')
      end
    end
  end

  context 'as org submitted' do
    let(:organization) { build_stubbed(:organization, :submitted) }
    let(:user) { build_stubbed(:user, organization: organization) }

    #before(:each) { sign_in admin }

    describe 'dashboard_for' do
      it 'organization_submitted_dashboard' do
        expect(dashboard_for(user)).to eq('organization_submitted_dashboard')
      end
    end
  end

  context 'as org approved' do
    let(:organization) { build_stubbed(:organization, :approved) }
    let(:user) { build_stubbed(:user, organization: organization) }
    # let(:mockUser) { instance_double('User', admin?: false, organization: Organization.....)}

    #before(:each) { sign_in admin }

    describe 'dashboard_for' do
      it 'organization_submitted_dashboard' do
        expect(dashboard_for(user)).to eq('organization_approved_dashboard')
      end
    end
  end


  context 'create dashboard' do
    let(:organization) { build_stubbed(:organization) }
    let(:user) { build_stubbed(:user, :organization) }

    #before(:each) { sign_in admin }

    describe 'dashboard_for' do
      it 'create_application_dashboard' do
        expect(dashboard_for(user)).to eq('create_application_dashboard')
      end
    end
  end
      

end
