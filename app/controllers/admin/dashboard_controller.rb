class Admin::DashboardController < InheritedResources::Base
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::NumberHelper
  
  respond_to :html, :xml, :json
  before_filter :require_user
  before_filter :require_admin_user
  layout 'admin'
  
  def welcome
  end

end