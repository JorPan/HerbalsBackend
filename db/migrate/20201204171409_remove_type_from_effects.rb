class RemoveTypeFromEffects < ActiveRecord::Migration[6.0]
  def change
    remove_column :effects, :type, :string
  end
end
