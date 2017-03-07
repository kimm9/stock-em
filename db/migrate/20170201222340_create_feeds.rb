class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :title
      t.text :summary
      t.string :url
      t.datetime :published
      t.string :guide

      t.timestamps
    end
  end
end
