class CreateModerators < ActiveRecord::Migration
  def change
    create_table :moderators do |t|
      t.integer :user_id
      t.integer :scope_id

      t.timestamps
    end
    add_index :moderators, :user_id
    add_index :moderators, :scope_id
    add_index :moderators, [:user_id, :scope_id], unique: true
  end
end
