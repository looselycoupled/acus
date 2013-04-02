ActiveAdmin.register HomepageFeature do


  index do
    column :title
    column :super_title
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :super_title
      f.input :content, :input_html => {:rows => 4}
      f.input :link_text
      f.input :link
      
      f.buttons
    end
  end
  

end
