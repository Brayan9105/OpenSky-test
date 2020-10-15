require 'rails_helper'

RSpec.describe "Applogs", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/applogs/index"
      expect(response).to have_http_status(:success)
    end
  end

end
