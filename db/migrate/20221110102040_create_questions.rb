class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|

      t.timestamps
      t.string :title,           null: false
      t.string :content,         null: false
      t.integer :tag_id,         null: false
      t.references :user,null:false,foreign_key: true
    end
  end
end
