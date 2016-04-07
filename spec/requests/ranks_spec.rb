require 'rails_helper'

RSpec.describe "Ranks", :type => :request do
  describe "GET /ranks" do
    it "works! (now write some real specs)" do
      get ranks_path
      expect(response.status).to be(200)
    end
  end
end
