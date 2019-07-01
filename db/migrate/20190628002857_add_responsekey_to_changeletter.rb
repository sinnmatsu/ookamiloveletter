class AddResponsekeyToChangeletter < ActiveRecord::Migration[5.0]
  def change
    add_column :changeletters, :responsekey, :string
  end
end
