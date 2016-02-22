require 'rails_helper'

RSpec.describe "Wanteds", :type => :request do
  describe "GET /wanteds" do
    it "works! (now write some real specs)" do
      get wanteds_path
      expect(response.status).to be(200)
    end
  end
end
