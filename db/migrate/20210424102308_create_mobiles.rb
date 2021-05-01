class CreateMobiles < ActiveRecord::Migration[6.1]
def change
    create_table :mobiles do |t|
      t.string :name
      t.string :model
      t.string :company
      t.string :imei1
      t.string :imei2
      t.string :invoice_price
      t.string :selling_price
      t.string :color
      t.datetime :purchasing_date
      t.datetime :selling_date
      t.boolean :sold, default: false
      t.timestamps
    end
  end
end
