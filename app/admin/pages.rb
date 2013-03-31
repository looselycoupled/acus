ActiveAdmin.register Page do

  controller do
    # tells active admin to use a different method for finding a record
    defaults finder: :find_by_slug
  end

  menu :parent => "Primary Content", :priority => 80
  
  config.sort_order = "ancestry_desc"


  index do
    column :title 
    column :created_at
    column :updated_at
    column :view_in_site do |p|
      link_to "View", "/" + (p.ancestors + [p]).map(&:to_param).join("/"), :target => "_blank"
    end
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :teaser, :input_html => {:rows => 4}
      f.input :content, :input_html => {:class => "ckeditor"}
    end

    f.buttons
  end 

  
end
