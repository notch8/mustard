class RunJob
  def self.run(test_case_id)
    TestCase.find(test_case_id).run
  end
end