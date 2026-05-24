class CreateChallenges < ActiveRecord::Migration[8.1]
  def change
    create_table :challenges do |t|
      t.string :name, null: false
      t.string :module, null: false
      t.text :content, null: false
      t.text :system_prompt, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
