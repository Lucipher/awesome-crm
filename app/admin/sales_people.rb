ActiveAdmin.register SalesPerson, :namespace => false do
  menu :parent => "Human Resources"
  actions :all, :except => [:destroy]
  config.filters = false

  index do
    column :id
    column :employee_name
    column :team_name
    column :commission
    column :credit_limit do |rec|
      number_to_currency rec.credit_limit, :unit => "$"
    end
    column :credit_balance do |rec|
      number_to_currency rec.credit_balance, :unit => "$"
    end
    column :locked

    default_actions
  end

  show do |sp|
    attributes_table do
      row :id
      row :employee_name
      row :team_name
      row :commission
      row :credit_limit do |rec|
        number_to_currency rec.credit_limit, :unit => "$"
      end
      row :credit_balance do |rec|
        number_to_currency rec.credit_balance, :unit => "$"
      end
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
