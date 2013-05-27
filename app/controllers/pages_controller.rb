class PagesController < ApplicationController
  
  layout "general"
  
  def show
    @page = Page.find_or_create_by_slug(request.path.split("/").last)  
  end
end
