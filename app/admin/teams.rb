ActiveAdmin.register Team, :as => "Sales Team", :namespace => false do
  menu :parent => "Human Resources"
  config.filters = false

  index do
    column :id
    column :name
    column :manager_name
    column :remarks

    default_actions
  end

  show :title => :name do |bpt|
    attributes_table do
      row :id
      row :name
      row :manager_name
      row :remarks
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :manager, :as => :select,
        :collection => Hash[SalesPerson.all.select{|p| p.employee}.map{|p| [p.employee.name, p.id]}]
      f.input :remarks,       :input_html => { :rows => 4 }
    end
    f.buttons
  end
end
