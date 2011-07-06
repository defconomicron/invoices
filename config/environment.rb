# Load the rails application
require File.expand_path('../application', __FILE__)

require "currency"

# Initialize the rails application
Invoices::Application.initialize!

class ActiveRecord::Base
  require "currency/active_record"
end
