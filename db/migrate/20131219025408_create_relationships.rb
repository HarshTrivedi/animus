class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :admirer_id
      t.integer :inspirer_id

      t.timestamps
    end
    add_index :relationships, :admirer_id
    add_index :relationships, :inspirer_id
  end
end
