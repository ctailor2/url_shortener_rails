class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url
      t.string :short_url
      t.integer :click_count, :default => 0
      t.references :user

      t.timestamps
    end
    add_index :urls, :user_id
  end
end
