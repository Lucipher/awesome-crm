ActiveAdmin.register GoodsReturned, :namespace => false do
  menu :parent => "Items"

  form do |f|
    f.inputs do
      f.input :doc_type
      f.input :doc_status
      f.input :doc_date
      f.input :doc_due_date
      f.input :doc_currency
      f.input :doc_rate
      f.input :doc_total
      f.input :doc_total_fc
      f.input :remarks
      f.input :employee
    end

    f.inputs do
      f.has_many :goods_returned_items do |fi|
        fi.input :item
        fi.input :quantity
        fi.input :price
        fi.input :currency
        fi.input :rate
        fi.input :line_total
        fi.input :total_foreign
        fi.input :tax_rate
        fi.input :tax_total
        fi.input :tax_total_foreign
        fi.input :grand_total
        fi.input :grand_total_foreign
        fi.input :remarks
      end
    end
  end

end
