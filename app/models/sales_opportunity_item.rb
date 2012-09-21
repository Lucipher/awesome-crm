class SalesOpportunityItem < ActiveRecord::Base
  self.table_name = "CRM.SALES_OPPORTUNITY_ITEMS"
  self.sequence_name = "CRM.SALES_OPPORTUNITY_ITEMS_SEQ"

  attr_accessible :close_date, :line_num, :line_status, :memo, :open_date, :pred_date, :status, :sales_opportunity_id

  belongs_to :sales_opportunity
end
