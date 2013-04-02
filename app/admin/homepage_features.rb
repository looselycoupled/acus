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

      if f.object.persisted? && f.object.image.file?
        f.input :image_file_name, :label => 'Existing File', :as => :warning, :value => image_tag(f.object.image.url(:full))
        f.input :image, :label => 'Replace File'
      else
        f.input :image, :hint => "Image will automatically be cropped and resized down to 300x200 pixels.  Please upload a file with a 3x2 aspect ratio."
      end

      f.input :link_text
      f.input :link
      
      f.buttons
    end
  end
  

end
