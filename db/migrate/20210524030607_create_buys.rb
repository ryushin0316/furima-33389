class CreateBuys < ActiveRecord::Migration[6.0]
  def change
    create_table :buys do |t|
      t.references :user, null: false
      t.references :item, null: false
      t.timestamps
    end
  end
end
