module DefaultPageContent
  extend ActiveSupport::Concern


  included do
    
  before_action :page_defaults
  end

  def page_defaults
    @page_title = "CoockingBolgFirst"
    @seo_keywords = "Ja Gotuje On Piecze portfolio"
  end 
  

end