class AddNameToDoses < ActiveRecord::Migration[6.0]
  def change
    add_column :doses, :name, :string
  end
end
