class AddBadgeToTech < ActiveRecord::Migration[6.1]
  def change
    add_column :teches, :badge, :text
  end
end
