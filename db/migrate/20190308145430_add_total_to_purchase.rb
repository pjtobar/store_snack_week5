class AddTotalToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :total, :decimal
  end
end
