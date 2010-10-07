class TestCasesController < InheritedResources::Base
  before_filter :authenticate_user!  
  def run
    @test_case = TestCase.find(params[:id])
    @test_case.delay.run
    redirect_to :action => :show
  end
  
  protected
  def begin_of_association_chain
    current_user
  end
  
end
