class AddReasonToPostletters < ActiveRecord::Migration[5.0]
  def change
    add_column :postletters, :reason, :string
  end
end
