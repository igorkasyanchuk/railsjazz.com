class Admin::ScreenshotsController < Admin::DashboardController
  belongs_to :project
  
  protected
    def collection
      @screenshots ||= end_of_association_chain.by_priority
    end
end