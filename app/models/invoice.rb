class Invoice < ActiveRecord::Base
  attr_money :total_price
  
  has_many :invoice_items, :dependent => :destroy
  
  accepts_nested_attributes_for :invoice_items, :allow_destroy => true, :reject_if => :reject_if_conditions
  
  before_save :do_before_save
  
  def do_before_save
    self.invoice_items[0] # NOTE: Uncommenting this out will cause issues?
    
    return true
  end
  
  def reject_if_conditions(options)
    return options[:price] == "0.00"
  end
end
