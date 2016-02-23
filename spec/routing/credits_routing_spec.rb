require "rails_helper"

RSpec.describe CreditsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/credits").to route_to("credits#index")
    end

    it "routes to #new" do
      expect(:get => "/credits/new").to route_to("credits#new")
    end

    it "routes to #show" do
      expect(:get => "/credits/1").to route_to("credits#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/credits/1/edit").to route_to("credits#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/credits").to route_to("credits#create")
    end

    it "routes to #update" do
      expect(:put => "/credits/1").to route_to("credits#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/credits/1").to route_to("credits#destroy", :id => "1")
    end

  end
end
