require 'rails_helper'

RSpec.describe RoutesController, type: :controller do
  let(:route) { create(:route) }
  let(:route_params) do
    {
      route: {
        route_number: route.route_number
      }
    }
  end

  describe "POST 'plot'" do
    it "redirects to the route page" do
      post :plot, params: route_params
      expect(response.status).to eq 302
      expect(response).to redirect_to route_path(route)
    end
  end

  describe "GET 'show'" do
    it "renders the show view for a route" do
      get :show, params: { id: route.route_number }
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end
end