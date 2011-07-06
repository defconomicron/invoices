class Invoice < ActiveRecord::Base
  attr_accessor_with_default :currency, "USD"
  
  composed_of :total_price,
    :class_name => "Money",
    :mapping => [%w(total_price cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
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
