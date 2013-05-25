ActiveAdmin.register Resource do

  controller do
    # tells active admin to use a different method for finding a record
    defaults finder: :find_by_slug
  end


  index do
    column :title 
    column :created_at
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :title
      f.input :teaser, :input_html => {:rows => 4}
      f.input :content, :input_html => {:class => "ckeditor"}
      f.input :photo,
        hint: image_preview_hint(resource.photo.url(:thumbnail))  
    end

    f.buttons
  end 

  
end
