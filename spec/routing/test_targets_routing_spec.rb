require "spec_helper"

describe TestTargetsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/test_targets" }.should route_to(:controller => "test_targets", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/test_targets/new" }.should route_to(:controller => "test_targets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/test_targets/1" }.should route_to(:controller => "test_targets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/test_targets/1/edit" }.should route_to(:controller => "test_targets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/test_targets" }.should route_to(:controller => "test_targets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/test_targets/1" }.should route_to(:controller => "test_targets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/test_targets/1" }.should route_to(:controller => "test_targets", :action => "destroy", :id => "1")
    end

  end
end
