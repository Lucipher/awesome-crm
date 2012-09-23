ActiveAdmin.register Team, :as => "Sales Team", :namespace => false do
  menu :parent => "Human Resources"

  index do
    column :id
    column :name
    column :manager do |record|
      link_to record.manager.employee.name, employee_path(record.manager.employee)
    end
    column :remarks

    default_actions
  end

  show :title => :name do |bpt|
    attributes_table do
      row :id
      row :name
      row :manager do |record|
        link_to record.manager.employee.name, employee_path(record.manager.employee)
      end
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
