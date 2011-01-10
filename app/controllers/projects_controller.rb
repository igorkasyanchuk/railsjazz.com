class ProjectsController < InheritedResources::Base
  
  def index
    redirect_to portfolio_path
  end
  
  def show
    @project = Project.find params["id"]
  end

end
