class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
