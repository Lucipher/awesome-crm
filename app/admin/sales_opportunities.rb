ActiveAdmin.register SalesOpportunity, :namespace => false do
  menu :parent => "Forms"
  actions :all, :except => [:destroy]

  index do
    column :id
    column :business_partner
    column("Created By") do |record|
      link_to record.sales_person.employee.name, employee_path(record.sales_person.employee)
    end
    column :doc_date
    column :open_date
    column :pred_date
    column :close_date
    column("Status")      { |record| status_tag(record.status) }

    default_actions
  end

  show do |r|
    attributes_table do
      row :id
      row :business_partner
      row :doc_date
      row :open_date
      row :pred_date
      row :close_date
      row("Status")      { |record| status_tag(record.status) }
      row :memo
      row :created_at
      row :updated_at
    end

    div :class => "panel" do
      h3 "Item List"
      if r.sales_opportunity_items and r.sales_opportunity_items.count > 0
        div :class => "panel_contents" do
          div :class => "attributes_table" do
            table do
              tr do
                th do "Owner" end
                th do "Line num" end
                th do "Line status" end
                th do "Open date" end
                th do "Pred date" end
                th do "Close date" end
                th do "Status" end
                th do "Memo" end
              end
              tbody do
                r.sales_opportunity_items.each do |ri|
                  tr do
                    td do ri.owner.nil? ? "" : ri.owner.employee.name end
                    td do ri.line_num end
                    td do ri.line_status end
                    td do ri.open_date end
                    td do ri.pred_date end
                    td do ri.close_date end
                    td do ri.status end
                    td do ri.memo end
                  end
                end
              end
            end
          end
        end
      else
        h3 "No items available"
      end
    end
  end

  form do |f|
    f.inputs "Document Header" do
      f.input :doc_date,        :as => :datepicker
      f.input :open_date,       :as => :datepicker
      f.input :pred_date,       :as => :datepicker
      f.input :close_date,      :as => :datepicker
      f.input :status,          :as => :select, :collection => %w(draft posted cancelled)
      f.input :memo
      f.input :business_partner
      f.input :sales_person_id, :as => :hidden, :value => current_user.employee.sales_person.id
    end

    f.inputs "Item List" do
      f.has_many :sales_opportunity_items do |fi|
        fi.input :owner
        fi.input :line_num
        fi.input :line_status
        fi.input :open_date,    :as => :datepicker
        fi.input :pred_date,    :as => :datepicker
        fi.input :close_date,   :as => :datepicker
        fi.input :status,       :as => :select, :collection => %w(draft posted cancelled)
        fi.input :memo
      end
    end

    f.buttons
  end
end
