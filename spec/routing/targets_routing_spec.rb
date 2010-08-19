require "spec_helper"

describe TargetsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/targets" }.should route_to(:controller => "targets", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/targets/new" }.should route_to(:controller => "targets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/targets/1" }.should route_to(:controller => "targets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/targets/1/edit" }.should route_to(:controller => "targets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/targets" }.should route_to(:controller => "targets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/targets/1" }.should route_to(:controller => "targets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/targets/1" }.should route_to(:controller => "targets", :action => "destroy", :id => "1")
    end

  end
end
