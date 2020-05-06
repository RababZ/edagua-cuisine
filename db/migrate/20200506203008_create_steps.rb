class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.integer :step_number
      t.text :description
      t.references :recipe, null: false, foreign_key: true
    end
  end
end
