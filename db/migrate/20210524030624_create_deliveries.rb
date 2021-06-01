class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.integer :area_id, null: false
      t.string :post_number, null: false
      t.string :city, null: false
      t.string :address_number, null: false
      t.string :phone_number, null: false
      t.string :building_name, null: false
      t.references :buy, null: false
      t.timestamps
    end
  end
end