class AddEffectsToStrains < ActiveRecord::Migration[6.0]
  def change
    add_column :strains, :positive_effects, :string
    add_column :strains, :negative_effects, :string
    add_column :strains, :medical_effects, :string
    add_column :strains, :name, :string
  end
end
