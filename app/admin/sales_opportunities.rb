ActiveAdmin.register SalesOpportunity, :namespace => false do
  menu :parent => "Forms"

  form do |f|
    f.inputs do
      f.input :doc_date
      f.input :open_date
      f.input :pred_date
      f.input :close_date
      f.input :status
      f.input :memo
      f.input :business_partner
      f.input :sales_person
    end

    f.inputs do
      f.has_many :sales_opportunity_items do |fi|
        fi.input :line_num
        fi.input :line_status
        fi.input :open_date
        fi.input :pred_date
        fi.input :close_date
        fi.input :status
        fi.input :memo
      end
    end
  end
end
