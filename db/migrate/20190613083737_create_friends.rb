class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.string :sentence
      t.string :person
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
