class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|

      t.timestamps
      t.references :user, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false
    end
  end
end
