ActiveAdmin.register SalesPerson, :namespace => false do
  menu :parent => "Human Resources"
  actions :all, :except => [:destroy]

  index do
    column :id
    column :employee
    column :team
    column :commission
    column :credit_balance
    column :locked

    default_actions
  end

  show do |sp|
    attributes_table do
      row :id
      row :employee
      row :team
      row :commission
      row :credit_limit
      row :credit_balance
      row :memo
      row :locked
    end
  end

  form do |f|
    f.inputs do
      f.input :employee
      f.input :team
      f.input :commission
      f.input :credit_limit
      f.input :credit_balance
      f.input :memo,       :input_html => { :rows => 4 }
      f.input :locked
    end

    f.buttons
  end
end
