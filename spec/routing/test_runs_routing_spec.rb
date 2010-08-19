require "spec_helper"

describe TestRunsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/test_runs" }.should route_to(:controller => "test_runs", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/test_runs/new" }.should route_to(:controller => "test_runs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/test_runs/1" }.should route_to(:controller => "test_runs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/test_runs/1/edit" }.should route_to(:controller => "test_runs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/test_runs" }.should route_to(:controller => "test_runs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/test_runs/1" }.should route_to(:controller => "test_runs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/test_runs/1" }.should route_to(:controller => "test_runs", :action => "destroy", :id => "1")
    end

  end
end
