# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Invoices::Application.initialize!

require "currency"

class ActiveRecord::Base
  require "currency/active_record"
end