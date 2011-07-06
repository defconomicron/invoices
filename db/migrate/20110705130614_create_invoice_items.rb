class CreateInvoiceItems < ActiveRecord::Migration
  def self.up
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.integer :price, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_items
  end
end
