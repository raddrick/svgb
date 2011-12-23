class AddAttributesToFrames < ActiveRecord::Migration
  def change
    change_table :frames do |t|
      t.string :name
      t.integer :height, :default => 222
      t.integer :width, :default => 333
      t.string :options
    end
  end
end
