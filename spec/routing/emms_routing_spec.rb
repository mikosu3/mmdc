require "rails_helper"

RSpec.describe EmmsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/emms").to route_to("emms#index")
    end

    it "routes to #new" do
      expect(:get => "/emms/new").to route_to("emms#new")
    end

    it "routes to #show" do
      expect(:get => "/emms/1").to route_to("emms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/emms/1/edit").to route_to("emms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/emms").to route_to("emms#create")
    end

    it "routes to #update" do
      expect(:put => "/emms/1").to route_to("emms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/emms/1").to route_to("emms#destroy", :id => "1")
    end

  end
end
