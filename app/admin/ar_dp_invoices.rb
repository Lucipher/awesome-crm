ActiveAdmin.register ArDpInvoice, :as => "AR Down Payment Invoice", :namespace => false do
  menu :parent => "Forms"
  actions :all, :except => [:destroy]

  index do
    column :id
    column :business_partner
    column :sales_person do |record|
      link_to record.sales_person.employee.name, employee_path(record.sales_person.employee)
    end
    column :due_date
    column :shipping_date
    column :grand_total
    column("Status")      { |record| status_tag(record.status) }

    default_actions
  end

  show do |r|
    attributes_table do
      row :id
      row :business_partner
      row :sales_person do |record|
        link_to record.sales_person.employee.name, employee_path(record.sales_person.employee)
      end
      row :type
      row("Status")      { |record| status_tag(record.status) }
      row :date
      row :due_date
      row :shipping_date
      row :currency
      row :rate
      row :total
      row :disc_rate
      row :disc_total
      row :tax_rate
      row :tax_total
      row :grand_total
      row :remarks
    end

    div :class => "panel" do
      h3 "Item List"
      if r.ar_dp_invoice_items and r.ar_dp_invoice_items.count > 0
        div :class => "panel_contents" do
          div :class => "attributes_table" do
            table do
              tr do
                th do "Item" end
                th do "SO Ref" end
                th do "Line num" end
                th do "Line status" end
                th do "Quantity" end
                th do "Price" end
                th do "Currency" end
                th do "Rate" end
                th do "Line total" end
                th do "Disc rate" end
                th do "Disc total" end
                th do "Tax rate" end
                th do "Tax total" end
                th do "Grand total" end
              end
              tbody do
                r.ar_dp_invoice_items.each do |ri|
                  tr do
                    td do ri.item.name end
                    td do ri.ref ? ri.ref.id : "" end
                    td do ri.line_num end
                    td do ri.line_status end
                    td do ri.quantity end
                    td do ri.price end
                    td do ri.currency end
                    td do ri.rate end
                    td do ri.line_total end
                    td do ri.disc_rate end
                    td do ri.disc_total end
                    td do ri.tax_rate end
                    td do ri.tax_total end
                    td do ri.grand_total end
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
      f.input :business_partner
      f.input :sales_person_id, :as => :hidden, :value => current_user.employee.sales_person.id
      f.input :type
      f.input :status,          :as => :select, :collection => %w(draft posted cancelled)
      f.input :date
      f.input :due_date
      f.input :shipping_date
      f.input :currency
      f.input :rate
      f.input :total
      f.input :disc_rate
      f.input :disc_total
      f.input :tax_rate
      f.input :tax_total
      f.input :grand_total
      f.input :remarks
    end

    f.inputs "Item List" do
      f.has_many :ar_dp_invoice_items do |fi|
        fi.input :item
        fi.input :line_num
        fi.input :line_status
        fi.input :quantity
        fi.input :price
        fi.input :currency
        fi.input :rate
        fi.input :line_total
        fi.input :disc_rate
        fi.input :disc_total
        fi.input :tax_rate
        fi.input :tax_total
        fi.input :grand_total
        fi.input :remarks
      end
    end

    f.buttons
  end  
end
