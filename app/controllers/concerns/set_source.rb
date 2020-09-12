module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_session
  end

  def set_session
    session[:query] = params[:q] if params[:q]
  end
end