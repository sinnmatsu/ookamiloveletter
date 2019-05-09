class AddHowtimerToPostletters < ActiveRecord::Migration[5.0]
  def change
    add_column :postletters, :howtimer, :string
  end
end
