class CreateTeches < ActiveRecord::Migration[6.1]
  def change
    create_table :teches do |t|
      t.string :title
      t.integer :percent_utilized

      t.timestamps
    end
  end
end
