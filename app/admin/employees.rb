ActiveAdmin.register Employee, :namespace => false do
  menu :parent => "Human Resources"
  actions :all, :except => [:destroy]
  config.filters = false

  index do
    column :id
    column :name
    column :job_title, :sortable => false
    column :department, :sortable => false
    column :phone
    column :email
    column :status

    default_actions
  end

  show :title => :name do |bp|
    attributes_table do
      row :id
      row :name
      row :gender
      row :job_title
      row :department
      row :phone
      row :email
      row :start_date
      row :terminate_date
      row :status
      row :remarks
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :gender,          :as => :select, :collection => %w(M F)
      f.input :job_title
      f.input :department
      f.input :phone
      f.input :email
      f.input :start_date,      :as => :datepicker
      f.input :terminate_date,  :as => :datepicker
      f.input :status,          :as => :select, :collection => %w(active suspended terminated)
      f.input :remarks,         :input_html => { :rows => 4 }
    end
    f.buttons
  end

  controller do
    def create
      @employee = Employee.new(params[:employee])
      @employee.id = Employee.connection.select_value("SELECT crm.employees_seq.nextval FROM DUAL")
      if @employee.save
        redirect_to @employee, :notice => "Employee was successfully created"
      else
        render :new
      end
    end
  end
end
