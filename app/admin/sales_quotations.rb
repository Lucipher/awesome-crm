ActiveAdmin.register SalesQuotation, :namespace => false do
  menu :parent => "Forms"

  form do |f|
    f.inputs do
      f.input :type
      f.input :status
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
      f.input :business_partner
      f.input :sales_person
    end

    f.inputs do
      f.has_many :sales_quotation_items do |fi|
        fi.input :line_num
        fi.input :line_status
        fi.input :item_id
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
  end
end
