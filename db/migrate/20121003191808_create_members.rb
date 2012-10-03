class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :scope_id

      t.timestamps
    end
    add_index :members, :user_id
    add_index :members, :scope_id
    add_index :members, [:user_id, :scope_id], unique: true
  end
end
