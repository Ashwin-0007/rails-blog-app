class DropComment < ActiveRecord::Migration[7.1]
  def change
    drop_table :comments do |t|
      t.string :title
      t.string :commentable_type
      t.integer :commentable_id

      t.timestamps
    end
  end
end
