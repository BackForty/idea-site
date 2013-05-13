class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :ideas, :user_id
  end
end
