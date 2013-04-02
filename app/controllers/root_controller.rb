class RootController < ApplicationController
  def home
    @features = HomepageFeature.recent
  end
end
