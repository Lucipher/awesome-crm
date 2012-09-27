ActiveAdmin.register Department, :namespace => false do
  menu :parent => "Human Resources"
  config.filters = false

  index do
    column :id
    column :name
    column :manager
    column :remarks

    default_actions
  end

  show :title => :name do |bpt|
    attributes_table do
      row :id
      row :name
      row :manager
      row :remarks
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :manager
      f.input :remarks,       :input_html => { :rows => 4 }
    end
    f.buttons
  end
end
