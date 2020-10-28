class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ""
      t.text :description, null: false
      t.integer :category_id, null: false, default: 0
      t.integer :condition_id, null: false, default: 0
      t.integer :shipment_type_id, null: false, default: 0
      t.integer :area_id, null: false, default: 0
      t.integer :days_to_ship_id, null: false, default: 0
      t.integer :price, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
