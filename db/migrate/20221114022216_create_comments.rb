class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :message
      t.integer :question_id
      t.integer :user_id

    end
  end
end
