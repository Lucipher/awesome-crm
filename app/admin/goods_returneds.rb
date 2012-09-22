ActiveAdmin.register GoodsReturned, :as => "Goods Returned Record", :namespace => false do
  menu :parent => "Inventory"

  index do
    column :id
    column :employee
    column :doc_date
    column :doc_due_date
    column :doc_currency
    column :doc_total
    column :doc_status

    default_actions
  end

  show do |r|
    attributes_table do
      row :doc_type
      row :doc_status
      row :doc_date
      row :doc_due_date
      row :doc_currency
      row :doc_rate
      row :doc_total
      row :doc_total_fc
      row :remarks
      row :employee
      row :created_at
      row :updated_at
    end

    div :class => "panel" do
      h3 "Returned Item List"
      if r.goods_returned_items and r.goods_returned_items.count > 0
        div :class => "panel_contents" do
          div :class => "attributes_table" do
            table do
              tr do
                th do "Item" end
                th do "Quantity" end
                th do "Price" end
                th do "Currency" end
                th do "Rate" end
                th do "Line total" end
                th do "Tax rate" end
                th do "Tax total" end
                th do "Grand total" end
                th do "Remarks" end
              end
              tbody do
                r.goods_returned_items.each do |ri|
                  tr do
                    td do ri.item.name end
                    td do ri.quantity end
                    td do ri.price end
                    td do ri.currency end
                    td do ri.rate end
                    td do ri.line_total end
                    td do ri.tax_rate end
                    td do ri.tax_total end
                    td do ri.grand_total end
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
      f.input :doc_type, :label => "Type"
      f.input :doc_status, :label => "Status"
      f.input :doc_date, :label => "Date"
      f.input :doc_due_date, :label => "Due date"
      f.input :doc_currency, :label => "Currency"
      f.input :doc_rate, :label => "Rate"
      f.input :doc_total, :label => "Total"
      f.input :doc_total_fc, :label => "Total FC"
      f.input :remarks
      f.input :employee_id, :as => :hidden, :value => current_user.employee.id
    end

    f.inputs "Item List" do
      f.has_many :goods_returned_items do |fi|
        fi.input :item
        fi.input :quantity
        fi.input :price
        fi.input :currency
        fi.input :rate
        fi.input :line_total
        fi.input :tax_rate
        fi.input :tax_total
        fi.input :grand_total
        fi.input :remarks
      end
    end

    f.buttons
  end

end
