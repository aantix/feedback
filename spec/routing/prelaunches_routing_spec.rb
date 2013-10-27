require "spec_helper"

describe PrelaunchesController do
  describe "routing" do

    it "routes to #index" do
      get("/prelaunches").should route_to("prelaunches#index")
    end

    it "routes to #new" do
      get("/prelaunches/new").should route_to("prelaunches#new")
    end

    it "routes to #show" do
      get("/prelaunches/1").should route_to("prelaunches#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prelaunches/1/edit").should route_to("prelaunches#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prelaunches").should route_to("prelaunches#create")
    end

    it "routes to #update" do
      put("/prelaunches/1").should route_to("prelaunches#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prelaunches/1").should route_to("prelaunches#destroy", :id => "1")
    end

  end
end
