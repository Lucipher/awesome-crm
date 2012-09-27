ActiveAdmin.register DeliveryOrder, :namespace => false do
  menu :parent => "Forms"
  actions :all, :except => [:destroy]
  config.filters = false

  index do
    column :id
    column :partner_name
    column :sales_person_name
    column :due_date
    column :shipping_date
    column :grand_total do |rec|
      number_to_currency rec.grand_total, :unit => "$"
    end
    column("Status")      { |record| status_tag(record.status) }

    default_actions
  end

  show do |r|
    attributes_table do
      row :id
      row :partner_name
      row :sales_person_name
      row :type
      row("Status")      { |record| status_tag(record.status) }
      row :doc_date
      row :due_date
      row :shipping_date
      row :total do |rec|
        number_to_currency rec.total, :unit => "$"
      end
      row :disc_total do |rec|
        number_to_currency rec.disc_total, :unit => "$"
      end
      row :tax_total do |rec|
        number_to_currency rec.tax_total, :unit => "$"
      end
      row :grand_total do |rec|
        number_to_currency rec.grand_total, :unit => "$"
      end
      row :partner_phone
      row :partner_billing_address
      row :partner_shipping_address
      row :partner_email
      row :partner_type
      row :shipping
      row :remarks
    end

    div :class => "panel" do
      h3 "Item List"
      if r.delivery_order_items and r.delivery_order_items.count > 0
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
                th do "Line total" end
                th do "Disc rate" end
                th do "Disc total" end
                th do "Tax rate" end
                th do "Tax total" end
                th do "Grand total" end
              end
              tbody do
                r.delivery_order_items.each do |ri|
                  tr do
                    td do ri.item.name end
                    td do ri.ref ? ri.ref.id : "" end
                    td do ri.line_num end
                    td do ri.line_status end
                    td do ri.quantity end
                    td do number_to_currency ri.price,        :unit => "$" end
                    td do number_to_currency ri.line_total,   :unit => "$" end
                    td do ri.disc_rate end
                    td do number_to_currency ri.disc_total,   :unit => "$" end
                    td do ri.tax_rate end
                    td do number_to_currency ri.tax_total,    :unit => "$" end
                    td do number_to_currency ri.grand_total,  :unit => "$" end
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
      f.input :doc_date,        :as => :datepicker
      f.input :due_date,        :as => :datepicker
      f.input :shipping_date,   :as => :datepicker
      f.input :remarks
    end

    f.inputs "Item List" do
      f.has_many :delivery_order_items do |fi|
        fi.input :item
        fi.input :line_num
        fi.input :line_status
        fi.input :quantity
        fi.input :price
        fi.input :disc_rate
        fi.input :tax_rate
        fi.input :remarks
      end
    end

    f.buttons
  end

  member_action :create_ar_invoice, :method => :post do
    src = DeliveryOrder.find(params[:id])
    dst = ArInvoice.copy_from(src)

    if dst.save
      flash[:notice] = "AR Invoice created successfully."
      redirect_to dst
    else
      flash.now[:error] = "Failed to create AR Invoice."
    end
  end

  action_item :only => :show do
    link_to('Create AR Invoice', create_ar_invoice_delivery_order_path(delivery_order), :method => :post)
  end

  member_action :create_sales_return, :method => :post do
    src = DeliveryOrder.find(params[:id])
    dst = SalesReturn.copy_from(src)

    if dst.save
      flash[:notice] = "Sales Return created successfully."
      redirect_to dst
    else
      flash.now[:error] = "Failed to create Sales Return."
    end
  end

  action_item :only => :show do
    link_to('Create Sales Return', create_sales_return_delivery_order_path(delivery_order), :method => :post)
  end

  controller do
    def create
      @delivery_order = DeliveryOrder.new(params[:delivery_order])
      @delivery_order.id = DeliveryOrder.connection.select_value("SELECT crm.delivery_orders_seq.nextval FROM DUAL")
      if @delivery_order.save
        redirect_to @delivery_order, :notice => "Delivery order was successfully created"
      else
        render :new
      end
    end
  end
end
