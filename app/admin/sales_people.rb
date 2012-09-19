ActiveAdmin.register SalesPerson, :namespace => false do
  menu :parent => "Human Resources"

  index do
    column :id
    column :employee
    column :team
    column :commission
    column :locked

    default_actions
  end

  show do |sp|
    attributes_table do
      row :id
      row :employee
      row :team
      row :commission
      row :memo
      row :locked
    end
  end

  form do |f|
    f.inputs do
      f.input :employee
      f.input :team
      f.input :commission
      f.input :memo,       :input_html => { :rows => 4 }
      f.input :locked
    end
    f.buttons
  end
end
