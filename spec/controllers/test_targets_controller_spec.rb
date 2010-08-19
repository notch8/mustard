require 'spec_helper'

describe TestTargetsController do

  def mock_test_target(stubs={})
    @mock_test_target ||= mock_model(TestTarget, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all test_targets as @test_targets" do
      TestTarget.stub(:all) { [mock_test_target] }
      get :index
      assigns(:test_targets).should eq([mock_test_target])
    end
  end

  describe "GET show" do
    it "assigns the requested test_target as @test_target" do
      TestTarget.stub(:find).with("37") { mock_test_target }
      get :show, :id => "37"
      assigns(:test_target).should be(mock_test_target)
    end
  end

  describe "GET new" do
    it "assigns a new test_target as @test_target" do
      TestTarget.stub(:new) { mock_test_target }
      get :new
      assigns(:test_target).should be(mock_test_target)
    end
  end

  describe "GET edit" do
    it "assigns the requested test_target as @test_target" do
      TestTarget.stub(:find).with("37") { mock_test_target }
      get :edit, :id => "37"
      assigns(:test_target).should be(mock_test_target)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created test_target as @test_target" do
        TestTarget.stub(:new).with({'these' => 'params'}) { mock_test_target(:save => true) }
        post :create, :test_target => {'these' => 'params'}
        assigns(:test_target).should be(mock_test_target)
      end

      it "redirects to the created test_target" do
        TestTarget.stub(:new) { mock_test_target(:save => true) }
        post :create, :test_target => {}
        response.should redirect_to(test_target_url(mock_test_target))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved test_target as @test_target" do
        TestTarget.stub(:new).with({'these' => 'params'}) { mock_test_target(:save => false) }
        post :create, :test_target => {'these' => 'params'}
        assigns(:test_target).should be(mock_test_target)
      end

      it "re-renders the 'new' template" do
        TestTarget.stub(:new) { mock_test_target(:save => false) }
        post :create, :test_target => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested test_target" do
        TestTarget.should_receive(:find).with("37") { mock_test_target }
        mock_test_target.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :test_target => {'these' => 'params'}
      end

      it "assigns the requested test_target as @test_target" do
        TestTarget.stub(:find) { mock_test_target(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:test_target).should be(mock_test_target)
      end

      it "redirects to the test_target" do
        TestTarget.stub(:find) { mock_test_target(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(test_target_url(mock_test_target))
      end
    end

    describe "with invalid params" do
      it "assigns the test_target as @test_target" do
        TestTarget.stub(:find) { mock_test_target(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:test_target).should be(mock_test_target)
      end

      it "re-renders the 'edit' template" do
        TestTarget.stub(:find) { mock_test_target(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested test_target" do
      TestTarget.should_receive(:find).with("37") { mock_test_target }
      mock_test_target.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the test_targets list" do
      TestTarget.stub(:find) { mock_test_target }
      delete :destroy, :id => "1"
      response.should redirect_to(test_targets_url)
    end
  end

end
