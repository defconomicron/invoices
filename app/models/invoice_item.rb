class InvoiceItem < ActiveRecord::Base
  attr_money :price
  
  belongs_to :invoice
end
