class AddColumnsToJoiners < ActiveRecord::Migration[6.0]
  def change
    add_column :joiners, :name, :string
    add_column :joiners, :category, :string
    add_column :joiners, :flavors, :string
    add_column :joiners, :positive_effects, :string
    add_column :joiners, :medical_effects, :string
    add_column :joiners, :negative_effects, :string
  end
end
