class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.string :title
      t.text :body
      t.integer :emotion
      t.integer :user_id
      t.integer :journal_id

      t.timestamps
    end
  end
end
