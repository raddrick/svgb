class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|

      t.timestamps
    end
  end
end
