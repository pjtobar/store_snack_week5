class AddQuantityToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :quantity, :integer
  end
end
