class RemoveProductIdFromComment < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :product_id, :integer
  end
end
