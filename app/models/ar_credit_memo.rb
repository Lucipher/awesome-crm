class ArCreditMemo < ActiveRecord::Base
  self.table_name = "CRM.AR_CREDIT_MEMOS"
  self.sequence_name = "CRM.AR_CREDIT_MEMOS_SEQ"

  attr_accessible :business_partner_id, :date, :disc_rate, :disc_total, :due_date, :grand_total,
                  :remarks, :sales_person_id, :shipping_date, :status, :tax_rate, :tax_total, :total, :type,
                  :ar_credit_memo_items_attributes

  belongs_to :business_partner
  belongs_to :sales_person

  has_many :ar_credit_memo_items, :dependent => :destroy
  has_many :items, :through => :ar_credit_memo_items

  accepts_nested_attributes_for :ar_credit_memo_items

  validates_presence_of :business_partner, :sales_person

  def self.copy_from(src)
    inst = ArCreditMemo.new

    inst.business_partner   = src.business_partner
    inst.date               = src.date
    inst.disc_total         = 0
    inst.due_date           = src.due_date
    inst.grand_total        = 0
    inst.remarks            = src.remarks
    inst.sales_person       = src.sales_person
    inst.shipping_date      = src.shipping_date
    inst.status             = 'draft'
    inst.tax_total          = 0
    inst.total              = 0
    inst.type               = src.type

    src.sales_return_items.each do |src_item|
      inst_item = ArCreditMemoItem.copy_from(src_item)
      inst_item.ar_credit_memo = inst
      inst.ar_credit_memo_items << inst_item
    end

    inst
  end
end
