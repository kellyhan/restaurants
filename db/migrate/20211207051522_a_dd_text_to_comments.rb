class ADdTextToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :text, :string
  end
end
