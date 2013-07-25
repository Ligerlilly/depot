class AddCartIdToLineItemsTable < ActiveRecord::Migration
  def change
    add_column :line_items, :cart_id, :integer
    add_index :line_items, :cart_id
  end
end
