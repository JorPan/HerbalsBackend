class CreateJoiners < ActiveRecord::Migration[6.0]
  def change
    create_table :joiners do |t|
      t.references :effect, null: false, foreign_key: true
      t.references :strain, null: false, foreign_key: true

      t.timestamps
    end
  end
end
