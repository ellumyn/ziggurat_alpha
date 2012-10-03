class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
      t.string :name

      t.timestamps
    end
    add_index :scopes, :name, unique: true
  end
end
