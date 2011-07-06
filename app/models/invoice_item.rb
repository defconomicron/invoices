class InvoiceItem < ActiveRecord::Base
  attr_accessor_with_default :currency, "USD"
  
  composed_of :price,
    :class_name => "Money",
    :mapping => [%w(price cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
  belongs_to :invoice
end
