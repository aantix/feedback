require "spec_helper"

describe FeedbackPagesController do
  describe "routing" do

    it "routes to #index" do
      get("/feedback_pages").should route_to("pages#index")
    end

    it "routes to #new" do
      get("/feedback_pages/new").should route_to("pages#new")
    end

    it "routes to #show" do
      get("/feedback_pages/1").should route_to("pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feedback_pages/1/edit").should route_to("pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feedback_pages").should route_to("pages#create")
    end

    it "routes to #update" do
      put("/feedback_pages/1").should route_to("pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feedback_pages/1").should route_to("pages#destroy", :id => "1")
    end

  end
end
