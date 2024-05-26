class CreateBlogpages < ActiveRecord::Migration[7.1]
  def change
    create_table :blogpages do |t|
      t.string :title
      t.string :author
      t.text :content
      t.string :avatar

      t.timestamps
    end
  end
end
