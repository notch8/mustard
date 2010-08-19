class TestCasesController < InheritedResources::Base
  
  def run
    @test_case = TestCase.find(params[:id])
    @test_case.run
    redirect_to :action => :show
  end
  
end
