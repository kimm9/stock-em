class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.string :company_name
      t.string :ticker
      t.float :quote
      t.float :price_change
      t.float :percentage_change

      t.timestamps
    end
  end
end
