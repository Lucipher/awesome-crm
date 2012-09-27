ActiveAdmin.register User, :namespace => false do
  config.filters = false

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
    f.inputs "User Information" do
      f.input :employee
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.inputs "Oracle DB Credentials" do
      f.input :db_username, :label => "DB Username"
      f.input :db_password, :label => "DB Password"
      f.input :db_password_confirmation, :label => "DB Password Confirmation"
    end
    f.buttons
  end
end
