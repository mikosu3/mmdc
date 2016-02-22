require 'rails_helper'

RSpec.describe "Emms", :type => :request do
  describe "GET /emms" do
    it "works! (now write some real specs)" do
      get emms_path
      expect(response.status).to be(200)
    end
  end
end
