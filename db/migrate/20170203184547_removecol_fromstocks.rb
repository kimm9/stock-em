class RemovecolFromstocks < ActiveRecord::Migration[5.0]
  def up
    remove_column :stocks, :quote
    remove_column :stocks, :price_change
    remove_column :stocks, :percentage_change
  end
end
