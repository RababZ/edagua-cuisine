class AddActiveTimeAndIdleTimeAndDifficultyAndServingSizeToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :active_time, :string
    add_column :recipes, :idle_time, :string
    add_column :recipes, :difficulty, :string
    add_column :recipes, :serving_size, :integer
  end
end
