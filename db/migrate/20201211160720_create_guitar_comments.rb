class CreateGuitarComments < ActiveRecord::Migration[5.2]
  def change
    create_table :guitar_comments do |t|
      t.integer :user_id
      t.integer :guitar_id
      t.text :comment

      t.timestamps
    end
  end
end
