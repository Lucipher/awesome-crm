ActiveAdmin.register Group, :as => "Item Group", :namespace => false do
  menu :parent => "Inventory"

  index do
    column :id
    column :name
    column :description

    default_actions
  end

  show :title => :name do |group|
    attributes_table do
      row :id
      row :name
      row :description
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description,       :input_html => { :rows => 4 }
    end
    f.buttons
  end
end
