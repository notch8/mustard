class TestCasesController < InheritedResources::Base
  before_filter :authenticate_user!  
  def run
    @test_case = TestCase.find(params[:id])
    @test_case.delay.run
    redirect_to :action => :show
  end
  
end
