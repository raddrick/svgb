class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.timestamps
    end
  end
end
