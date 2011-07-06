class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :total_price, :default => 0
      
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
