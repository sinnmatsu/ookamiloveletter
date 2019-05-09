class AddDisclosureAtToPostletters < ActiveRecord::Migration[5.0]
  def change
    add_column :postletters, :disclosure_at, :time
  end
end
