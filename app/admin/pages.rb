ActiveAdmin.register Page do

  controller do
    # tells active admin to use a different method for finding a record
    defaults finder: :find_by_slug
  end

  config.sort_order = "ancestry_desc"


  index do
    column :title 
    column :parent
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

      if resource.id
        # parent listing should not include current node or it's descendants
        illegal_ids = resource.descendant_ids.append(resource.id)
        pages = Page.arrange_as_array.reject{|p| illegal_ids.include? p.id}.collect {|n|  ["#{'-' * n.depth} #{n.title}", n.id] }
      else
        pages = Page.arrange_as_array.collect {|p|  ["#{'-' * p.depth} #{p.title}", p.id] }
      end
      f.input :parent_id, :as => :select, :collection => pages


      f.input :teaser, :input_html => {:rows => 4}
      
      f.input :content, :input_html => {:class => "ckeditor"}
    end

    f.buttons
  end 

  
end
