class CreateStrains < ActiveRecord::Migration[6.0]
  def change
    create_table :strains do |t|
      t.string :race
      t.string :flavor
      t.string :effect

      t.timestamps
    end
  end
end
