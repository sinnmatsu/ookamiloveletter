class AddLoginshowToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :loginshow, foreign_key: { to_table: :users }
  end
end
