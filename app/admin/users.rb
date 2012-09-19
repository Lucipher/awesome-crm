ActiveAdmin.register User, :namespace => false do
  filter :employee

  index do
    column :id
    column :employee, :sortable => false
    column :username
    column :db_username

    default_actions
  end

  show :title => :username do |bp|
    attributes_table do
      row :id
      row :employee
      row :username
      row :db_username
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :employee
      f.input :username
      f.input :password
      f.input :password_confirmation
      f.input :db_username
      f.input :db_password
      f.input :db_password_confirmation
    end
    f.buttons
  end
end
