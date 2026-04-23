class CreateUpdates < ActiveRecord::Migration[8.0]
  def change
    create_table :updates do |t|
      t.references :field, null: false, foreign_key: true
      t.integer :stage, null: false
      t.text :notes
      
      t.timestamps
    end
  end
end