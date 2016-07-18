require 'rails_helper'

RSpec.describe StopsController, type: :controller do
  let(:stop) { create(:stop) }
  let(:stop_params) do
    {
      'stops-search-txt': "Main and Washington, Stop #{stop.stop_id}",
      'transfer': "1",
      stop: {
        id: stop.stop_id
      }
    }
  end

  describe "GET 'index'" do 
    it "returns the index page with success" do 
      get :index
      expect(response).to be_success
      expect(response.status).to eq 200
      expect(response).to have_http_status 200
    end
  end

  describe "POST 'plot'" do
    it "redirects to the stop page" do
      post :plot, params: stop_params
      expect(response.status).to eq 302
      expect(response).to redirect_to stop_path(id: stop.stop_id, transfer: stop_params[:transfer])
    end
  end

  describe "GET 'show'" do
    it "renders the show view for a stop" do
      get :show, params: { id: stop.stop_id }
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end
end