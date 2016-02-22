require "rails_helper"

RSpec.describe WantedsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/wanteds").to route_to("wanteds#index")
    end

    it "routes to #new" do
      expect(:get => "/wanteds/new").to route_to("wanteds#new")
    end

    it "routes to #show" do
      expect(:get => "/wanteds/1").to route_to("wanteds#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/wanteds/1/edit").to route_to("wanteds#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/wanteds").to route_to("wanteds#create")
    end

    it "routes to #update" do
      expect(:put => "/wanteds/1").to route_to("wanteds#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/wanteds/1").to route_to("wanteds#destroy", :id => "1")
    end

  end
end
