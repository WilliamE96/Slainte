class AddDetailsToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :content, :string
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
