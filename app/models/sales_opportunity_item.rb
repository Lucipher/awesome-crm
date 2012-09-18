class SalesOpportunityItem < ActiveRecord::Base
  set_table_name "CRM.SALES_OPPORTUNITY_ITEMS"
  self.sequence_name = "CRM.SALES_OPPORTUNITY_ITEMS_SEQ"

  attr_accessible :close_date, :line_num, :line_status, :memo, :open_date, :pred_date, :status

  belongs_to :sales_opportunity
end
