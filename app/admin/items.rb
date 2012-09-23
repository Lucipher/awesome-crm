ActiveAdmin.register Item, :namespace => false do
  menu :parent => "Inventory"
  actions :all, :except => [:destroy]

  index do
    column :id
    column :name
    column :group, :sortable => false
    column :on_hand
    column :committed
    column :on_order
    column :average_price
    column :stock_value

    default_actions
  end

  show :title => :name do |item|
    attributes_table do
      row :id
      row :name
      row :group
      row :status
      row :type
      row :unit
      row :weight
      row :length
      row :width
      row :height
      row :on_hand
      row :committed
      row :on_order
      row :max_quantity
      row :reorder_quantity
      row :last_purchase_price
      row :last_purchase_date
      row :last_sales_price
      row :last_sales_date
      row :average_price
      row :stock_value
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :group
      f.input :status
      f.input :type
      f.input :unit
      f.input :weight
      f.input :length
      f.input :width
      f.input :height
      f.input :max_quantity
      f.input :reorder_quantity
    end
    f.buttons
  end
end
