require 'rails_helper'

RSpec.describe "Credits", :type => :request do
  describe "GET /credits" do
    it "works! (now write some real specs)" do
      get credits_path
      expect(response.status).to be(200)
    end
  end
end
