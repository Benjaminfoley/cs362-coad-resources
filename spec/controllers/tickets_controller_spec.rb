# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  # REMEMBER TO ONLY TEST IF SUCCESSFUL OR IF REDIRECT
  # login = new_user_session_path (redirect if you're not logged in)
  # admin = successful
  context 'as admin user' do
    let(:admin) { create :user, :admin }
    let(:ticket) { create :ticket }
    before(:each) { sign_in admin }

    describe 'GET #new' do
      it 'is successful' do
        expect(get(:new)).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do
      it 'successful' do
        post :create, params: { ticket: attributes_for(:ticket) }
        expect(response).to have_http_status(:ok)
      end

      it 'not successful' do
        expect_any_instance_of(Ticket).to receive(:save).and_return(false)
        post :create, params: { ticket: attributes_for(:ticket) }
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #show' do
      it 'successful' do
        expect(get(:show, params: { id: ticket.id })).to have_http_status(:ok)
      end
    end

    describe 'POST #capture' do
      it 'redirects to dashboard' do
        expect(post(:capture, params: { id: ticket.id })).to redirect_to(dashboard_path)
      end

    end

    describe 'POST #release' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: ticket.id })).to redirect_to(dashboard_path)
      end

      it ' admin path tickets:captured' do
        allow(controller).to receive(:current_user).and_return(admin)
        allow(admin).to receive_message_chain(:organization, :approved?).and_return(true)
        expect(post(:release, params: { id: ticket.id })).to redirect_to(dashboard_path << '#tickets:captured')
        
      end
    end

    describe 'PATCH #close' do
      it 'redirects to dashboard tickets open' do
        expect(patch(:close, params: { id: ticket.id })).to redirect_to(dashboard_path << '#tickets:open')
      end

      it ' admin path tickets:captured' do
        allow(controller).to receive(:current_user).and_return(admin)
        allow(admin).to receive_message_chain(:organization, :approved?).and_return(true)
        allow(TicketService).to receive(:close_ticket).with("1", admin).and_return(:ok)
        expect(patch(:close, params: { id: ticket.id })).to redirect_to(dashboard_path << '#tickets:open')
        
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to dashboard' do
        expect(delete(:destroy, params: { id: ticket.id })).to be_redirect
      end
    end
  end

  context 'as organization' do
    let(:organization) { build_stubbed :organization, :approved }
    let(:user) { create :user, organization_id: organization.id}
    let(:ticket) {create :ticket, organization_id: organization.id}

    before(:each) { sign_in user }

    describe 'GET #new' do
      it 'successful' do
        expect(get(:new)).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do
      it 'successful' do
        post :create, params: { ticket: attributes_for(:ticket) }
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'GET #show' do
      it 'successful' do 
        allow(controller).to receive(:current_user).and_return(user)
        allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
        get(:show, params: {id: ticket.id})
        expect(response).to have_http_status(:ok)
      end
    end

    describe 'POST #capture' do
      it 'redirects to dashboard' do
        expect(post(:capture, params: { id: 1 })).to redirect_to(dashboard_path)
      end

      it 'captured ticket' do
        allow(controller).to receive(:current_user).and_return(user)
        allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
        allow(TicketService).to receive(:capture_ticket).with("1", user).and_return(:ok)
        post(:capture, params: { id: ticket.id } )
        expect(response).to redirect_to(dashboard_path << '#tickets:open')
      end

      it 'not successful' do
        allow(controller).to receive(:current_user).and_return(user)
        allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
        expect(post :capture, params: { id: ticket.id}).to render_template(:show)
      end
    end

    describe 'POST #release' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: 1 })).to redirect_to(dashboard_path)
      end

      it ' org path tickets:organization' do
        allow(controller).to receive(:current_user).and_return(user)
        allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
        expect(post(:release, params: { id: ticket.id })).to redirect_to(dashboard_path << '#tickets:organization')
        
      end

      it ' release fail' do
        allow(controller).to receive(:current_user).and_return(user)
        allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
        allow(TicketService).to receive(:release_ticket).with("1", user).and_return(:error)
        post(:release, params: { id: ticket.id })
        expect(response).to render_template(:show)
        
      end
    end

    describe 'PATCH #close' do
      it 'redirects to dashboard' do
        expect(patch(:close, params: { id: 1 })).to redirect_to(dashboard_path)
      end

      it ' org path tickets:organization' do
        allow(controller).to receive(:current_user).and_return(user)
        allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
        allow(TicketService).to receive(:close_ticket).with("1", user).and_return(:ok)
        expect(patch(:close, params: { id: ticket.id })).to redirect_to(dashboard_path << '#tickets:organization')
        
      end

      it ' release fail' do
        allow(controller).to receive(:current_user).and_return(user)
        allow(user).to receive_message_chain(:organization, :approved?).and_return(true)
        allow(TicketService).to receive(:close_ticket).with("1", user).and_return(:error)
        patch(:close, params: { id: ticket.id })
        expect(response).to render_template(:show)
        
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to dashboard' do
        expect(delete(:destroy, params: { id: 1 })).to be_redirect
      end
    end
  end

  context 'as a non-logged-in user' do
    let(:user) {create :user}

    describe 'GET #new' do
      it 'redirects to login page' do
        expect(get(:new)).to have_http_status(:ok)
      end
    end

    describe 'POST #create' do
      it 'redirects to login page' do
        expect(post(:create, params: { ticket: attributes_for(:ticket) })).to have_http_status(:ok)
      end

      it 'save fail' do
        expect_any_instance_of(Ticket).to receive(:save).and_return(false)
        post(:create, params: { ticket: attributes_for(:ticket) })
        expect(response).to render_template(:new)
      end
    end

    describe 'GET #show' do
      it 'successful' do
        allow(controller).to receive(:current_user).and_return(user)
        expect(get(:show, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'POST #capture' do
      it 'redirects to dashboard' do
        expect(post(:capture, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'POST #release' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'PATCH #close' do
      it 'redirects to dashboard' do
        expect(post(:release, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects to dashboard' do
        expect(delete(:destroy, params: { id: 1 })).to redirect_to(dashboard_path)
      end
    end
  end
end
