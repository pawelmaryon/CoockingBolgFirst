class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
    @copyright = PMaryonViewTool::Renderer.copyright "Pawel Maryon", "#{@page_title}", "h2"
  end
end

module PMaryonViewTool
  class Renderer
    def self.copyright name, message, tag_type
      "&copy; #{Time.now.year} | <#{tag_type}>#{name}</#{tag_type}> #{message}".html_safe
    end
  end
end