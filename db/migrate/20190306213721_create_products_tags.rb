class CreateProductsTags < ActiveRecord::Migration[5.2]
  def change
    create_join_table :products, :tags do |t|
      t.index :product_id
      t.index :tag_id
    end
  end
end
