class AddUserIdToBlogpages < ActiveRecord::Migration[7.1]
  def change
    add_reference :blogpages, :user, foreign_key: true
  end
end
