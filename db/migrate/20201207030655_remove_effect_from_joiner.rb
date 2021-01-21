class RemoveEffectFromJoiner < ActiveRecord::Migration[6.0]
  def change
    remove_reference :joiners, :effect, null: false, foreign_key: true
  end
end
