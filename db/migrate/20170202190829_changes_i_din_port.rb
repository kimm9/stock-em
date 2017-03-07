class ChangesIDinPort < ActiveRecord::Migration[5.0]
  def change
    rename_column :portfolios, :uder_id, :user_id
  end
end
