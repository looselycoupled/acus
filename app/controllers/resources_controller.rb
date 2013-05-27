class ResourcesController < ApplicationController

  layout "general"

  def index
    @resources = Resource.all
  end
  
  def show
    @resource = Resource.find(params[:id])
  end
  
end