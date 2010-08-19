require 'spec_helper'

describe TestRunsController do

  def mock_test_run(stubs={})
    @mock_test_run ||= mock_model(TestRun, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all test_runs as @test_runs" do
      TestRun.stub(:all) { [mock_test_run] }
      get :index
      assigns(:test_runs).should eq([mock_test_run])
    end
  end

  describe "GET show" do
    it "assigns the requested test_run as @test_run" do
      TestRun.stub(:find).with("37") { mock_test_run }
      get :show, :id => "37"
      assigns(:test_run).should be(mock_test_run)
    end
  end

  describe "GET new" do
    it "assigns a new test_run as @test_run" do
      TestRun.stub(:new) { mock_test_run }
      get :new
      assigns(:test_run).should be(mock_test_run)
    end
  end

  describe "GET edit" do
    it "assigns the requested test_run as @test_run" do
      TestRun.stub(:find).with("37") { mock_test_run }
      get :edit, :id => "37"
      assigns(:test_run).should be(mock_test_run)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created test_run as @test_run" do
        TestRun.stub(:new).with({'these' => 'params'}) { mock_test_run(:save => true) }
        post :create, :test_run => {'these' => 'params'}
        assigns(:test_run).should be(mock_test_run)
      end

      it "redirects to the created test_run" do
        TestRun.stub(:new) { mock_test_run(:save => true) }
        post :create, :test_run => {}
        response.should redirect_to(test_run_url(mock_test_run))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved test_run as @test_run" do
        TestRun.stub(:new).with({'these' => 'params'}) { mock_test_run(:save => false) }
        post :create, :test_run => {'these' => 'params'}
        assigns(:test_run).should be(mock_test_run)
      end

      it "re-renders the 'new' template" do
        TestRun.stub(:new) { mock_test_run(:save => false) }
        post :create, :test_run => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested test_run" do
        TestRun.should_receive(:find).with("37") { mock_test_run }
        mock_test_run.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :test_run => {'these' => 'params'}
      end

      it "assigns the requested test_run as @test_run" do
        TestRun.stub(:find) { mock_test_run(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:test_run).should be(mock_test_run)
      end

      it "redirects to the test_run" do
        TestRun.stub(:find) { mock_test_run(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(test_run_url(mock_test_run))
      end
    end

    describe "with invalid params" do
      it "assigns the test_run as @test_run" do
        TestRun.stub(:find) { mock_test_run(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:test_run).should be(mock_test_run)
      end

      it "re-renders the 'edit' template" do
        TestRun.stub(:find) { mock_test_run(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested test_run" do
      TestRun.should_receive(:find).with("37") { mock_test_run }
      mock_test_run.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the test_runs list" do
      TestRun.stub(:find) { mock_test_run }
      delete :destroy, :id => "1"
      response.should redirect_to(test_runs_url)
    end
  end

end
