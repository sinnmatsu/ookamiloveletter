class CreateSecrets < ActiveRecord::Migration[5.0]
  def change
    create_table :secrets do |t|
      t.references :user, foreign_key: true
      t.references :lookuser, foreign_key: { to_table: :users }
      t.references :likeuser, foreign_key: { to_table: :users }
      t.string :secrettext

      t.timestamps
    end
  end
end
