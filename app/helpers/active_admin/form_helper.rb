module ActiveAdmin::FormHelper

  def image_preview_hint(url)
    html = (url.include? "missing") ?  "No photo has been uploaded" : image_tag(url)
  end
  
end