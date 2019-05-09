class AddCheckToPostletters < ActiveRecord::Migration[5.0]
  def change
    add_column :postletters, :check, :string
  end
end
