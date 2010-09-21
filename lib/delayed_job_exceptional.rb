# begin
 
  Delayed::Worker.logger.info "Adding Exceptional support to Delayed::Job"
  
  begin
    module Delayed
      class Job
        
        def invoke_job_with_exceptional
          if defined?(Exceptional)
            Delayed::Job.send(:define_method, :invoke_job_with_exceptional) do
              Exceptional.rescue("DelayedJob Worker") do
                invoke_job_without_exceptional
              end
            end
          else
            Delayed::Job.send(:define_method, :invoke_job_with_exceptional) do
              invoke_job_without_exceptional
            end
          end
          invoke_job_with_exceptional
        end
        
        alias_method_chain :invoke_job, :exceptional
        
      end # Job
    end # Delayed
  rescue Exception => e
    Delayed::Worker.logger.error(e)
    raise e
  end
 
  
# rescue Exception => e
# end