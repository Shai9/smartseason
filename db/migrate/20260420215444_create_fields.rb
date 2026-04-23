class CreateFields < ActiveRecord::Migration[8.0]
  def change
    create_table :fields do |t|
      t.string :name, null: false
      t.string :crop_type, null: false
      t.date :planting_date, null: false
      t.integer :current_stage, default: 0
      t.references :agent, foreign_key: { to_table: :users }, null: true
      
      t.timestamps
    end
  end
end