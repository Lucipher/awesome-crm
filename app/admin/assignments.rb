ActiveAdmin.register Assignment, :namespace => false do
  menu :parent => "Partners", :label => "Sales Person Assignments"

  index do
    column :sales_person do |record|
      link_to record.sales_person.employee.name, employee_path(record.sales_person.employee)
    end
    column :business_partner

    default_actions
  end

  show do
    attributes_table do
      row :sales_person do |record|
        link_to record.sales_person.employee.name, employee_path(record.sales_person.employee)
      end
      row :business_partner
    end
  end

  form do |f|
    f.inputs do
      f.input :sales_person, :as => :select, :collection => Hash[SalesPerson.all.map{|p| [p.employee.name, p.id]}]
      f.input :business_partner
    end

    f.buttons
  end
end
