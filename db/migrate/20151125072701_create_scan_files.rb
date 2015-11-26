class CreateScanFiles < ActiveRecord::Migration
  def change
    create_table :scan_files do |t|
      t.text :result

      t.timestamps null: false
    end
  end
end
