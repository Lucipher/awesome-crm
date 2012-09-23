ActiveAdmin.register GoodsReceived, :as => "Goods Received Record", :namespace => false do
  menu :parent => "Inventory"
  actions :all, :except => [:destroy]

  index do
    column :id
    column :employee
    column :doc_date
    column :doc_due_date
    column :doc_total do |rec|
      number_to_currency rec.doc_total, :unit => "$"
    end
    column("Status")      { |record| status_tag(record.doc_status) }

    default_actions
  end

  show do |r|
    attributes_table do
      row :doc_type
      row("Status")      { |record| status_tag(record.doc_status) }
      row :doc_date
      row :doc_due_date
      row :doc_total do |rec|
        number_to_currency rec.doc_total, :unit => "$"
      end
      row :remarks
      row :employee
      row :created_at
      row :updated_at
    end

    div :class => "panel" do
      h3 "Received Item List"
      if r.goods_received_items and r.goods_received_items.count > 0
        div :class => "panel_contents" do
          div :class => "attributes_table" do
            table do
              tr do
                th do "Item" end
                th do "Quantity" end
                th do "Price" end
                th do "Line total" end
                th do "Tax rate" end
                th do "Tax total" end
                th do "Grand total" end
                th do "Remarks" end
              end
              tbody do
                r.goods_received_items.each do |ri|
                  tr do
                    td do ri.item.name end
                    td do ri.quantity end
                    td do number_to_currency ri.price,        :unit => "$" end
                    td do number_to_currency ri.line_total,   :unit => "$" end
                    td do ri.tax_rate end
                    td do number_to_currency ri.tax_total,    :unit => "$" end
                    td do number_to_currency ri.grand_total,  :unit => "$" end
                    td do ri.remarks end
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
      f.input :doc_type,      :label => "Type"
      f.input :doc_status,    :label => "Status",   :as => :select, :collection => %w(draft posted cancelled)
      f.input :doc_date,      :label => "Date",     :as => :datepicker
      f.input :doc_due_date,  :label => "Due date", :as => :datepicker
      f.input :remarks
      f.input :employee_id,                         :as => :hidden, :value => current_user.employee.id
    end

    f.inputs "Item List" do
      f.has_many :goods_received_items do |fi|
        fi.input :item
        fi.input :quantity
        fi.input :price
        fi.input :tax_rate
        fi.input :remarks
      end
    end

    f.buttons
  end

end
