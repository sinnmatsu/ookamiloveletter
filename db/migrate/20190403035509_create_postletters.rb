class CreatePostletters < ActiveRecord::Migration[5.0]
  def change
    create_table :postletters do |t|
      t.references :user, foreign_key: true
      t.references :fromuser, foreign_key: { to_table: :users }
      t.string :text
      t.string :which

      t.timestamps
      
    end
  end
end
