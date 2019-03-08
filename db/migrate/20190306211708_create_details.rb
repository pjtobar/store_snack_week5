class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.references :product, foreign_key: true
      t.references :purchase, foreign_key: true
      t.integer :state
      t.integer :quantity

      t.timestamps
    end
  end
end
