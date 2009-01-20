# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_bloget_refresh_session_id'
  include AuthenticatedSystem  

  # Multisite support
  # http://railstips.org/2006/11/13/building-a-multi-site-supported-application
  include AccountLocation

  before_filter :find_current_site
  helper_method :current_site
  attr_reader   :current_site

  private

    def find_current_site
      @current_site = Site.find_by_subdomain(account_subdomain)
    end

end
