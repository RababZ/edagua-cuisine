class RenameDescriptionQuantity < ActiveRecord::Migration[6.0]
  def change
    rename_column :ingredients, :description, :quantity
  end
end
