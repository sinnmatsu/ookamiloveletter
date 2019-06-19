class AddPersonToPostletters < ActiveRecord::Migration[5.0]
  def change
    add_column :postletters, :person, :string
  end
end
