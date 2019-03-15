class AddStateToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :state, :integer
  end
end
