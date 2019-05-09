class AddAccountToPostletters < ActiveRecord::Migration[5.0]
  def change
    add_column :postletters, :account, :string
  end
end
