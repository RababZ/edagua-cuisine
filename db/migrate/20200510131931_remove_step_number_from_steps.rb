class RemoveStepNumberFromSteps < ActiveRecord::Migration[6.0]
  def change
    remove_column :steps, :step_number, :integer
  end
end
