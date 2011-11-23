class AddLftAndRgtToComments < ActiveRecord::Migration
  def change
    add_column :comments, :lft, :integer
    add_column :comments, :rgt, :integer
  end
end
