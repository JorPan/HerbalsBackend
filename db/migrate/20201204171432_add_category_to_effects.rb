class AddCategoryToEffects < ActiveRecord::Migration[6.0]
  def change
    add_column :effects, :category, :string
  end
end
