class RemoveEffectFromStrains < ActiveRecord::Migration[6.0]
  def change
    remove_column :strains, :effect, :string
  end
end
