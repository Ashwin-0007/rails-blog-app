class AddUserAndBlogpageReferencesToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :user,  foreign_key: true, null: true
    add_reference :comments, :blogpage,  foreign_key: true, null: true
  end
end
