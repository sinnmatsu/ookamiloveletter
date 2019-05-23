class CreateLooks < ActiveRecord::Migration[5.0]
  def change
    create_table :looks do |t|
      t.references :user, foreign_key: true
      t.references :secret, foreign_key: true

      t.timestamps
    end
  end
end
