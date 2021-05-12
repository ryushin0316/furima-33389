class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :type_id, null: false
      t.integer :delivery_pay_id, null: false
      t.integer :area_id, null: false
      t.integer :day_id, null: false
      t.integer :price, null: false
      t.timestamps

    end
  end
end
