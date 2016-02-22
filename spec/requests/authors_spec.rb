require 'rails_helper'

RSpec.describe "Authors", :type => :request do
  describe "GET /authors" do
    it "works! (now write some real specs)" do
      get authors_path
      expect(response.status).to be(200)
    end
  end
end
