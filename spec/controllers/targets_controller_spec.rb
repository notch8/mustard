require 'spec_helper'

describe TargetsController do

  def mock_target(stubs={})
    @mock_target ||= mock_model(Target, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all targets as @targets" do
      Target.stub(:all) { [mock_target] }
      get :index
      assigns(:targets).should eq([mock_target])
    end
  end

  describe "GET show" do
    it "assigns the requested target as @target" do
      Target.stub(:find).with("37") { mock_target }
      get :show, :id => "37"
      assigns(:target).should be(mock_target)
    end
  end

  describe "GET new" do
    it "assigns a new target as @target" do
      Target.stub(:new) { mock_target }
      get :new
      assigns(:target).should be(mock_target)
    end
  end

  describe "GET edit" do
    it "assigns the requested target as @target" do
      Target.stub(:find).with("37") { mock_target }
      get :edit, :id => "37"
      assigns(:target).should be(mock_target)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created target as @target" do
        Target.stub(:new).with({'these' => 'params'}) { mock_target(:save => true) }
        post :create, :target => {'these' => 'params'}
        assigns(:target).should be(mock_target)
      end

      it "redirects to the created target" do
        Target.stub(:new) { mock_target(:save => true) }
        post :create, :target => {}
        response.should redirect_to(target_url(mock_target))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved target as @target" do
        Target.stub(:new).with({'these' => 'params'}) { mock_target(:save => false) }
        post :create, :target => {'these' => 'params'}
        assigns(:target).should be(mock_target)
      end

      it "re-renders the 'new' template" do
        Target.stub(:new) { mock_target(:save => false) }
        post :create, :target => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested target" do
        Target.should_receive(:find).with("37") { mock_target }
        mock_target.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :target => {'these' => 'params'}
      end

      it "assigns the requested target as @target" do
        Target.stub(:find) { mock_target(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:target).should be(mock_target)
      end

      it "redirects to the target" do
        Target.stub(:find) { mock_target(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(target_url(mock_target))
      end
    end

    describe "with invalid params" do
      it "assigns the target as @target" do
        Target.stub(:find) { mock_target(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:target).should be(mock_target)
      end

      it "re-renders the 'edit' template" do
        Target.stub(:find) { mock_target(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested target" do
      Target.should_receive(:find).with("37") { mock_target }
      mock_target.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the targets list" do
      Target.stub(:find) { mock_target }
      delete :destroy, :id => "1"
      response.should redirect_to(targets_url)
    end
  end

end
