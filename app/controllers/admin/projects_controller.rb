class Admin::ProjectsController < Admin::DashboardController
  
  protected
    def collection
      @projects ||= end_of_association_chain.by_priority
    end  
  
end