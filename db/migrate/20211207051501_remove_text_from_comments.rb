class RemoveTextFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :text
  end
end
