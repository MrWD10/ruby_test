class CreateTechnalogies < ActiveRecord::Migration[6.1]
  def change
    create_table :technalogies do |t|
      t.string :name
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
