class CreateThinks < ActiveRecord::Migration[5.0]
  def change
    create_table :thinks do |t|
      t.references :user, foreign_key: true
      t.references :fromuser, foreign_key: { to_table: :users }
      t.string :person

      t.timestamps
    end
  end
end
